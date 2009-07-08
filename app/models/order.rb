class Order < ActiveRecord::Base
  include AASM
  # BEGIN has_many_transactions
  has_many :transactions, 
           :class_name => 'OrderTransaction', 
           :dependent => :destroy
  # END has_many_transactions
  
  belongs_to :user
  has_one :cart
  
  belongs_to :shipping_address, :class_name => "ProfileAddress", :foreign_key => "shipping_address_id"
  belongs_to :billing_address, :class_name => "ProfileAddress", :foreign_key => "billing_address_id"
  
  validates_presence_of :card_number
  validates_presence_of :verification_number
  validates_presence_of :expiration_month
  validates_presence_of :expiration_year
  
  attr_accessor :verification_number, :card_number, :card_type, :same_as_billing, :expiration_month, :expiration_year, :credit_card
  
  # BEGIN acts_as_state_machine
  aasm_initial_state :pending

  aasm_state :pending
  aasm_state :authorized
  aasm_state :paid
  aasm_state :payment_declined
  aasm_state :shipped
  aasm_state :canceled

  aasm_event :payment_authorized do
    transitions :from => :pending, 
                :to   => :authorized

    transitions :from => :payment_declined, 
                :to   => :authorized
  end

  aasm_event :payment_captured do
    transitions :from => :authorized, 
                :to   => :paid
  end
  
  aasm_event :order_shipped do
    transitions :from => :paid,
                :to => :shipped
  end
  
  aasm_event :order_canceled do
    transitions :from => :paid,
                :to => :canceled
  end
  
  aasm_event :transaction_declined do
    transitions :from => :pending, 
                :to   => :payment_declined

    transitions :from => :payment_declined, 
                :to   => :payment_declined

    transitions :from => :authorized, 
                :to   => :authorized
  end
  # END acts_as_state_machine
  
  # BEGIN authorize_payment
  def authorize_payment(options = {:ip => '127.0.0.1'})
    options = setup_order(options)
    
    transaction do

      authorization = OrderTransaction.authorize(5000, credit_card, options)
      transactions.push(authorization)

      if authorization.success?
        puts "-"*100+" \n Payment Authorized"
        payment_authorized!
      else
        transaction_declined!
      end

      authorization
    end
  end
  # END authorize_payment

  def setup_order(options)
    options[:description] = "NJG Order: #{id}"
    
    options[:order_id] = id
    options[:billing_address] = {
      :name => "#{billing_address.first_name} #{billing_address.last_name}",
      :address1 => "#{billing_address.street_1}",
      :address2 => "#{billing_address.street_2}",
      :city => "#{billing_address.city}",
      :state => "#{billing_address.state}",
      :zip => "#{billing_address.zip}",
      :country => "#{billing_address.country}"
    }
    
    unless shipping_address.nil?
      options[:shipping_address] = {
        :name => "#{first_name} #{last_name}",
        :address1 => "#{address_1}",
        :address2 => "#{address_2}",
        :city => "#{city}",
        :state => "#{shipping_state}",
        :zip => "#{zip}"
      }
    end
    
    options[:merchant] = "NotJustaGame.com"
    options
    #options[:email] = user.email
  end

  # BEGIN capture_payment
  def capture_payment(options = {:ip => '127.0.0.1'})
    transaction do
      capture = OrderTransaction.capture(5000, authorization_reference, options)
      transactions.push(capture)
      if capture.success?
        payment_captured!
      else
        transaction_declined!
      end
      
      capture
    end
  end

  # Retrieves the latest uthorization reference stored for the current order.
  def authorization_reference
    if authorization = transactions.find_by_action_and_success('authorization', true, :order => 'id ASC')
      authorization.reference
    end
  end
  
  # Should be converted into a named scope ASAP.
  def self.lookup(phrase)
    self.find(:all, :conditions => ['id=? OR billing_first_name=? OR billing_last_name=?',phrase,phrase,phrase])
  end
  
  # Creates a new active merchant credit card object given stored parameters.
  def credit_card
    credit_card = ActiveMerchant::Billing::CreditCard.new(
      :first_name         => billing_address.first_name,
      :last_name          => billing_address.last_name,
      :number             => card_number,
      :month              => expiration_month,
      :year               => expiration_year,
      :verification_value => verification_number
    )
  end
  
  def billing_address
    ProfileAddress.find_with_deleted(read_attribute(:billing_address_id))
  end
  
  def shipping_address
    ProfileAddress.find_with_deleted(read_attribute(:shipping_address_id))
  end
end

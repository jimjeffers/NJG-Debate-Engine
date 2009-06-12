class Order < ActiveRecord::Base
  include AASM
  # BEGIN has_many_transactions
  has_many :transactions, 
           :class_name => 'OrderTransaction', 
           :dependent => :destroy
  # END has_many_transactions
  belongs_to :user
  has_one :cart
  
  validates_presence_of :card_number
  validates_presence_of :verification_number
  validates_presence_of :expiration_month
  validates_presence_of :expiration_year
  
  attr_accessor :verification_number, :card_number, :card_type, :same_as_billing, :expiration_month, :expiration_year
  
  def before_save
    product_id = nil if product_id == 'invoice'
    if same_as_billing
      self.first_name = billing_first_name
      self.last_name = billing_last_name
      self.shipping_state = billing_state
      self.address_1 = billing_address_1
      self.address_2 = billing_address_2
      self.zip = billing_zip
      self.city = billing_city
    end
  end
  
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

  # BEGIN number
  def number
    CGI::Session.generate_unique_id
  end
  # END number
  
  def calculated_amount
    unless product.nil?
      self.amount = (product.price.to_f * quantity) * 100
    else
      self.amount = custom_payment_amount.to_f * 100
    end
    return self.amount
  end
  
  # BEGIN authorize_payment
  def authorize_payment(credit_card, options = {})
    self.calculated_amount
    unless product.nil?
      options[:description] = "Ordered product: #{product.name}; price: #{product.price.to_f}; quantity: #{quantity}"
    else
      options[:description] = "Payment of $#{custom_payment_amount.to_f} towards invoice ID: #{invoice_id}"
    end
    
    options[:order_id] = number
    options[:billing_address] = {
      :name => "#{billing_first_name} #{billing_last_name}",
      :address1 => "#{billing_address_1}",
      :address2 => "#{billing_address_2}",
      :city => "#{billing_city}",
      :state => "#{billing_state}",
      :zip => "#{billing_zip}",
      :phone => "#{phone_number}"
    }
    
    options[:shipping_address] = {
      :name => "#{first_name} #{last_name}",
      :address1 => "#{address_1}",
      :address2 => "#{address_2}",
      :city => "#{city}",
      :state => "#{shipping_state}",
      :zip => "#{zip}"
    }
    
    options[:merchant] = "Marketing With a Flair"
    options[:email] = email
    
    transaction do

      authorization = OrderTransaction.authorize(amount.to_i, credit_card, options)
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

  # BEGIN capture_payment
  def capture_payment(options = {})
    transaction do
      capture = OrderTransaction.capture(amount, authorization_reference, options)
      transactions.push(capture)
      if capture.success?
        payment_captured!
      else
        transaction_declined!
      end
      
      capture
    end
  end
  # END capture_payment

  # BEGIN authorization_reference
  def authorization_reference
    if authorization = transactions.find_by_action_and_success('authorization', true, :order => 'id ASC')
      authorization.reference
    end
  end
  # END authorization_reference
  
  def self.lookup(phrase)
    self.find(:all, :conditions => ['id=? OR billing_first_name=? OR billing_last_name=?',phrase,phrase,phrase])
  end
end

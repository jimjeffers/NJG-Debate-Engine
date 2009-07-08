class ProfileAddress < ActiveRecord::Base
  has_many :orders_as_billing, :class_name => "Order", :foreign_key => "billing_address_id"
  has_many :orders_as_shipping, :class_name => "Order", :foreign_key => "shipping_address_id"
  belongs_to :user
  
  validates_presence_of :street_1
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zip
  acts_as_paranoid
end

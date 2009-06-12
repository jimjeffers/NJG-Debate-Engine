class Cart < ActiveRecord::Base
  include AASM
  has_many :products, :through => :cart_items
  has_many :cart_items
  belongs_to :user
  belongs_to :order
  
  # BEGIN: AASM States to handle cart processing.
  aasm_initial_state :pending
  aasm_state :pending
  aasm_state :ordered

  aasm_event :show do
    transitions :to => :ordered, :from => [:pending]
  end
end

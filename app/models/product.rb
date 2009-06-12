class Product < ActiveRecord::Base
  include AASM
  belongs_to :sport
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :description
  
  acts_as_taggable
  has_guid :name

  # BEGIN: AASM States to handle product visibilty.
  aasm_initial_state :hiding
  aasm_initial_state :hiding
  aasm_initial_state :selling

  aasm_event :show do
    transitions :to => :selling, :from => [:hiding]
  end
  
  aasm_event :hide do
    transitions :to => :hiding, :from => [:selling]
  end
end
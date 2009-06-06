class Article < ActiveRecord::Base
  include AASM
  named_scope :published, :conditions => "aasm_state='published'"
  named_scope :publicized, :conditions => "aasm_state IN ('published','featured')"
  named_scope :featured, :conditions => "aasm_state='featured'"
  named_scope :submitted, :conditions => "aasm_state='submitted'"
  named_scope :deleted, :conditions => "aasm_state='deleted'"
  named_scope :for_sport, lambda { |sport| {:conditions => "category_id IN (#{sport.category_ids})"} }
  named_scope :chonologically, :order => "published_at DESC"
  
  belongs_to :category, :counter_cache => true
  belongs_to :user, :counter_cache => true
  
  validates_presence_of :category_id, :message => "must be specified"
  validates_presence_of :user_id, :message => "must be specified"
  
  has_guid :title

  # BEGIN: AASM States to handle publishing.
  aasm_initial_state :draft
  aasm_state :draft
  aasm_state :submitted
  aasm_state :published, :enter => :publish_date
  aasm_state :deleted
  aasm_state :featured

  aasm_event :submit do
    transitions :to => :submitted, :from => [:draft]
  end

  aasm_event :delete do
    transitions :to => :deleted, :from => [:draft, :submitted, :published]
  end
  
  aasm_event :publish do
    transitions :to => :published, :from => [:draft, :submitted]
  end
  
  aasm_event :feature do
    transitions :to => :featured, :from => [:published]
  end
  
  aasm_event :undelete do
    transitions :to => :draft, :from => [:deleted]
  end
  # END: AASM States to handle publishing.
  
  def publish_date
    update_attribute(:published_at,Time.now) if published_at.nil?
  end
  
  # Returns the name of the sport from the parent category.
  def sport
    category.sport.name
  end
end

class Article < ActiveRecord::Base
  include AASM
  named_scope :drafted, :conditions => "aasm_state='draft'"
  named_scope :published, :conditions => "aasm_state='published'"
  named_scope :publicized, :conditions => "aasm_state IN ('published','featured')"
  named_scope :featured, :conditions => "aasm_state='featured'"
  named_scope :submitted, :conditions => "aasm_state='submitted'"
  named_scope :deleted, :conditions => "aasm_state='deleted'"
  named_scope :for_sport, lambda { |sport| {:conditions => "category_id IN (#{sport.category_ids})"} }
  named_scope :chronologically, :order => "published_at DESC"
  
  belongs_to :category, :counter_cache => true
  belongs_to :user, :counter_cache => true
  
  validates_presence_of :category_id, :message => "must be specified"
  validates_presence_of :user_id, :message => "must be specified"
  
  acts_as_taggable
  has_guid :title

  # BEGIN: AASM States to handle publishing.
  aasm_initial_state :draft
  aasm_state :draft
  aasm_state :submitted
  aasm_state :published, :enter => :publish_date
  aasm_state :shelved
  aasm_state :deleted
  aasm_state :featured

  aasm_event :revert do
    transitions :to => :draft, :from => [:submitted,:shelved,:published,:featured,:deleted]
  end
  
  aasm_event :submit do
    transitions :to => :submitted, :from => [:draft]
  end
  
  aasm_event :publish do
    transitions :to => :published, :from => [:draft, :submitted, :shelved]
  end
  
  aasm_event :feature do
    transitions :to => :featured, :from => [:published, :shelved]
  end
  
  aasm_event :unfeature do
    transitions :to => :published, :from => [:featured]
  end
  
  aasm_event :shelf do
    transitions :to => :shelved, :from => [:published, :featured]
  end
  
  aasm_event :delete do
    transitions :to => :deleted,:from => [:submitted,:shelved,:published,:featured,:draft]
  end
  
  aasm_event :undelete do
    transitions :to => :draft, :from => [:deleted]
  end
  
  # Returns all states in aasm as an array of strings.
  def self.states
    aasm_states.collect { |s| s.name.to_s }
  end
  
  # Returns all events in aasm as an array of strings.
  def self.events
    Article.aasm_events.collect{ |k,v| k.to_s }
  end
  
  # Define protected states as a constant.
  EDITOR_ONLY = %w(feature featured publish published shelf shelved unfeature)
  
  # END: AASM States to handle publishing.
  
  def publish_date
    update_attribute(:published_at,Time.now) if published_at.nil?
  end
  
  # Returns the name of the sport from the parent category.
  def sport
    category.sport.name
  end
end

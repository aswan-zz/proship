class Member < ActiveRecord::Base
  belongs_to :country#, :class_name => 'Country', :primary_key  => 'country_id'
  belongs_to :citizenship, :class_name => 'Country', :foreign_key  => 'citizenship_id'
  belongs_to :residency, :class_name => 'Country', :foreign_key  => 'residency_id'
  belongs_to :state_prov#, :class_name => 'StateProv', :primary_key  => 'state_prov_id'
  belongs_to :roles
  has_many :meeting_members
  has_many :meetings, through: :meeting_members
  has_many :reminders
  has_many :messages_as_member_from, foreign_key: :member_from_id, class_name: Message
  has_many :messages_as_member_to, foreign_key: :member_to_id, class_name: Message

  attr_accessor :password
  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
  has_many :availabilities
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  validates :password, :confirmation => true #password_confirmation attr

  def self.search(term)
    where('LOWER(first_name) LIKE :term OR LOWER(last_name) LIKE :term', term: "#{term.downcase}%")
  end
  
  def full_name                                                                                                                                                                                     
    ([first_name, last_name] - ['']).compact.join(' ')
  end
end

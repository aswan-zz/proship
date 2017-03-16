class Member < ActiveRecord::Base
  belongs_to :country#, :class_name => 'Country', :primary_key  => 'country_id'
  belongs_to :citizenship, :class_name => 'Country', :foreign_key  => 'citizenship_id'
  belongs_to :residency, :class_name => 'Country', :foreign_key  => 'residency_id'
  belongs_to :state_prov#, :class_name => 'StateProv', :primary_key  => 'state_prov_id'
  belongs_to :roles
  has_many :meetings, through: :meeting_members
  has_many :reminders
  has_many :messages 

  attr_accessor :password
  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
  has_many :availabilities
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  validates :password, :confirmation => true #password_confirmation attr

end

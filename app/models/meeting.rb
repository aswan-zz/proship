class Meeting < ActiveRecord::Base
  belongs_to :meeting_type
  has_many :members, through: :meeting_members
  
  #accepts_nested_attributes_for :meeting_types, :allow_destroy => :true

end

class Availability < ActiveRecord::Base
  belongs_to :availability_type
  belongs_to :member
  belongs_to :creator, :class_name => 'Member', :foreign_key  => 'creator_id'
end

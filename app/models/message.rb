class Message < ActiveRecord::Base
  belongs_to :member_to
  belongs_to :member_from
end

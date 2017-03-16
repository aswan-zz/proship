class Reminder < ActiveRecord::Base
  belongs_to :member
  belongs_to :reminder_type
end

class MeetingType < ActiveRecord::Base
  has_many :meetings
  validates :name, presence: true, uniqueness: true

  def icon_and_text
    "<i class='#{icon}'></i> #{name}".html_safe
  end
end

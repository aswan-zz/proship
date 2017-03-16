class NoteType < ActiveRecord::Base
  has_many :notes
  validates :name, presence: true, uniqueness: true
  validates :icon, presence: true
  
  def icon_and_text
    "<i class='#{icon}'></i> #{name}".html_safe
  end

end

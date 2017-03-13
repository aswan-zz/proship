class NoteType < ActiveRecord::Base
  has_many :notes
  
  def icon_and_text
    "<i class='#{icon}'></i> #{name}".html_safe
  end

end

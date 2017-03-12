class Note < ActiveRecord::Base
  belongs_to :note_type#, class_name: "NoteType", foreign_key: "note_type_id"
  belongs_to :member_from, class_name: "Member", foreign_key: "member_id"
  belongs_to :member_to, class_name: "Member", foreign_key: "member_id"
  
  validates_presence_of :note_type_id, :member_to_id, :content
end

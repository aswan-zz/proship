class MeetingMembers < ActiveRecord::Migration
  def change
    create_table :meeting_members do |t|
      t.references :member, index: true, foreign_key: true
      t.references :meeting, index: true, foreign_key: true
      t.string :role 
      t.string :accepted
       
      t.timestamps null: false
    end
  end
end

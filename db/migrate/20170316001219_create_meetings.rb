class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.references :meeting_type, index: true, foreign_key: true
      t.datetime :scheduled
      t.text :note

      t.timestamps null: false
    end
  end
end

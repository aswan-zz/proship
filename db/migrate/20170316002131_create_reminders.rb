class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.references :member, index: true, foreign_key: true
      t.references :reminder_type, index: true, foreign_key: true
      t.string :note
      t.datetime :schedule

      t.timestamps null: false
    end
  end
end

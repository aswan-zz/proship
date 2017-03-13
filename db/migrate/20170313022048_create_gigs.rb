class CreateGigs < ActiveRecord::Migration
  def change
    create_table :gigs do |t|
      t.references :chair, index: true, foreign_key: true
      t.references :room, index: true, foreign_key: true
      t.references :rank, index: true, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.integer :job_number

      t.timestamps null: false
    end
  end
end

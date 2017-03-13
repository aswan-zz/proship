class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.date :start_date
      t.date :end_date
      t.text :comment
      t.references :availability_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

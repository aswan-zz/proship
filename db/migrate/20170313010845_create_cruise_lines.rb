class CreateCruiseLines < ActiveRecord::Migration
  def change
    create_table :cruise_lines do |t|
      t.string :name
      t.string :short_name

      t.timestamps null: false
    end
  end
end

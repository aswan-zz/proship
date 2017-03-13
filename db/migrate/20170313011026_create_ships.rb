class CreateShips < ActiveRecord::Migration
  def change
    create_table :ships do |t|
      t.string :name
      t.references :cruise_line, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

class CreateAirports < ActiveRecord::Migration
  def change
    create_table :airports do |t|
      t.string :name
      t.string :city
      t.string :country
      t.string :iata_faa
      t.string :iaco
      t.decimal :latitude
      t.decimal :longitude
      t.integer :altitude
      t.integer :zone
      t.string :dst

      t.timestamps null: false
    end
  end
end

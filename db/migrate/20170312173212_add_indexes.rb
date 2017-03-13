class AddIndexes < ActiveRecord::Migration
  def change
    add_index :airports, :name
    add_index :airports, :city
    add_index :airports, :iata_faa
    add_index :countries, :name
    add_index :state_provs, :name
  end
end

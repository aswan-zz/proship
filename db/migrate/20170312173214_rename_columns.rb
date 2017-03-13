class RenameColumns < ActiveRecord::Migration
  def change
    rename_column :members, :state_prov, :state_prov_id
    rename_column :members, :country, :country_id
    rename_column :members, :residency, :residency_id
    rename_column :members, :citizenship, :citizenship_id
  end
end

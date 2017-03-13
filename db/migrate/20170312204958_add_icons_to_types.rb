class AddIconsToTypes < ActiveRecord::Migration
  def self.up  
    add_column :note_types, :icon, :string  
  end
  def self.down
    remove_column :note_types, :icon
  end  
end

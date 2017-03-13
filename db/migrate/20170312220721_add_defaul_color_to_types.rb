class AddDefaulColorToTypes < ActiveRecord::Migration
  def self.up  
    add_column :note_types, :default_color, :string  
  end
  def self.down
    remove_column :note_types, :default_color
  end  
end

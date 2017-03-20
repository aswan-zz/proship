class RenameNoteToContentInMessages < ActiveRecord::Migration
  def self.up  
    rename_column :messages, :note, :content  
  end
  def self.down
    rename_column :messages, :content, :note  
  end  
end

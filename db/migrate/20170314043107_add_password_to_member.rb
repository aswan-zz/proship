class AddPasswordToMember < ActiveRecord::Migration
  def self.up  
    add_column :members, :password, :string  
  end
  def self.down
    remove_column :members, :password
  end  
end

class AddFakePassToMembers < ActiveRecord::Migration
  def self.up  
    add_column :members, :fakepass, :string  
  end
  def self.down
    remove_column :members, :fakepass
  end  
end

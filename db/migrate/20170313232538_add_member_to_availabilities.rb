class AddMemberToAvailabilities < ActiveRecord::Migration
  def self.up  
    add_column :availabilities, :member_id, :integer  
    add_column :availabilities, :creator_id, :integer  
  end
  def self.down
    remove_column :availabilities, :member_id
    remove_column :availabilities, :creator_id
  end  
end

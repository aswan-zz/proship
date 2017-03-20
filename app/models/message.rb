class Message < ActiveRecord::Base
  belongs_to :member_to, :class_name => 'Member', :foreign_key  => 'member_to_id'
  belongs_to :member_from, :class_name => 'Member', :foreign_key  => 'member_from_id'
  belongs_to :parent, :class_name => "Message", :foreign_key => "parent"
  validates_presence_of :member_from_id, :member_to_id, :content
  
  def member_to_name
    member_to.full_name
  end
  def member_from_name
    member_from.full_name
  end

  def self.create_from_hash(hash)
    msg = self.new
    hash.select {|k, v| 
      if self.column_names.include? k 
        msg[k] = v
      end
      puts "k = " + k + " included? " + (self.column_names.include? k).to_s
    }
    msg
  end

end

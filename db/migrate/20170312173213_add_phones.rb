class AddPhones < ActiveRecord::Migration
  def change
    add_column :members, :main_phone, :integer
    add_column :members, :main_mobile, :integer
  end
end

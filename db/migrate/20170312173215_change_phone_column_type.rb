class ChangePhoneColumnType < ActiveRecord::Migration
  def up
    change_table :members do |t|
      t.change :main_phone, :string, limit: 30
      t.change :main_mobile, :string, limit: 30
    end
  end
  def down
    change_table :members do |t|
      t.change :main_phone, :integer
      t.change :main_mobile, :integer
    end
  end
end

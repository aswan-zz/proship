class CreateStateProvs < ActiveRecord::Migration
  def change
    create_table :state_provs do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end

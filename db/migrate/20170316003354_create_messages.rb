class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :member_to, index: true, foreign_key: true
      t.references :member_from, index: true, foreign_key: true
      t.text :note
      t.integer :parent

      t.timestamps null: false
    end
  end
end

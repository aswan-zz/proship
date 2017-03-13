class CreateChairs < ActiveRecord::Migration
  def change
    create_table :chairs do |t|
      t.string :name
      t.references :room, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

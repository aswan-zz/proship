class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :original_name
      t.string :file_name
      t.boolean :profile
      t.text :image_data
      t.references :member, index: true, foreign_key: true
      t.references :uploaded_by, index: true, foreign_key: { to_table: :members }

      t.timestamps null: false
    end
  end
end

class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :content
      t.references :note_type, index: true, foreign_key: { to_table: :note_types }
      t.references :member_from, index: true, foreign_key: { to_table: :members }
      t.references :member_to, index: true, foreign_key: { to_table: :members }

      t.timestamps null: false
    end
  end
end

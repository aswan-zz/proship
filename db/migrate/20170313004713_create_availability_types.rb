class CreateAvailabilityTypes < ActiveRecord::Migration
  def change
    create_table :availability_types do |t|
      t.string :name
      t.string :icon
      t.string :default_color

      t.timestamps null: false
    end
  end
end

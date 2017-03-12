class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.string :pronounce
      t.string :email
      t.date :birthday
      t.string :address
      t.string :city
      t.integer :state_prov
      t.integer :country
      t.string :zip_post
      t.string :home_airport
      t.string :medical_conditions
      t.string :criminal_convictions
      t.integer :residency
      t.integer :citizenship
      t.integer :employee_number

      t.timestamps null: false
    end
  end
end

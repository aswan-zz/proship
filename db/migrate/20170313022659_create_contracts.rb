class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.references :gig, index: true, foreign_key: true
      t.decimal :salary
      t.references :contract_status, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

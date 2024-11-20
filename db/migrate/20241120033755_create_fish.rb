# db/migrate/20231120201450_create_fish.rb
class CreateFish < ActiveRecord::Migration[7.0]
  def change
    create_table :fish do |t|
      t.string :name
      t.decimal :price
      t.string :species
      t.integer :size
      t.string :water_type
      t.integer :quantity
      t.timestamps
    end
  end
end

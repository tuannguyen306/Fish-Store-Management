class DropFishesTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :fishes if ActiveRecord::Base.connection.table_exists?(:fishes)
  end
end

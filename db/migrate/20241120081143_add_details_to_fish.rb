class AddDetailsToFish < ActiveRecord::Migration[7.0]
  def change
    add_column :fish, :species, :string
    add_column :fish, :water_type, :string
    add_column :fish, :quantity, :integer
  end
end

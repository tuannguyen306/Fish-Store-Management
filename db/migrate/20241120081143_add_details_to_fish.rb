class AddDetailsToFish < ActiveRecord::Migration[7.0]
  def change
    # Add species column if it doesn't exist
    unless column_exists?(:fish, :species)
      add_column :fish, :species, :string
    end

    # Add water_type column if it doesn't exist
    unless column_exists?(:fish, :water_type)
      add_column :fish, :water_type, :string
    end

    # Add quantity column if it doesn't exist
    unless column_exists?(:fish, :quantity)
      add_column :fish, :quantity, :integer
    end

    # Add size column if it doesn't exist
    unless column_exists?(:fish, :size)
      add_column :fish, :size, :integer
    end
  end
end



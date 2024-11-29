class RemoveImageFromFish < ActiveRecord::Migration[7.0]
  def change
    remove_column :fish, :images, :string
  end
end

class AddImagesandDescriptionToFish < ActiveRecord::Migration[7.0]
  def change
    add_column :fish, :images, :string
    add_column :fish, :description, :text
  end
end

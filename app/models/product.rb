class Product < ApplicationRecord
    # Associations
    has_many :sales, dependent: :destroy  # Ensures associated sales are destroyed when the product is deleted
  
    # Validations
    validates :name, :price, presence: true
    validates :price, numericality: { greater_than: 0 }  # Ensure price is greater than zero
  end
  
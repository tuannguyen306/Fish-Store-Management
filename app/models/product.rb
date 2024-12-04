class Product < ApplicationRecord
    # Associations
    has_many :sales, dependent: :destroy  # Ensures associated sales are destroyed when the product is deleted
    
    # Validations
    validates :name, presence: true, length: { maximum: 100 }
    validates :price, presence: true, numericality: { greater_than: 0 }
    validates :description, length: { maximum: 500 }, allow_blank: true
    validates :category, presence: true
  end
  
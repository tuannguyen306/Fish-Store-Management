class Fish < ApplicationRecord
    validates :name, presence: true
    validates :price, numericality: { greater_than_or_equal_to: 0 }
    validates :species, presence: true
    validates :size, numericality: { only_integer: true, greater_than: 0 }
    validates :water_type, inclusion: { in: %w[freshwater saltwater brackish] }
  end
  
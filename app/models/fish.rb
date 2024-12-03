class Fish < ApplicationRecord
  has_one_attached :image

  # Image validation
  validates :image, presence: true, if: :image_attached?
  validate :image_content_type_validation, if: :image_attached?
  validate :image_size_validation, if: :image_attached?

  # Other validations
  validates :name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :species, presence: true
  validates :size, numericality: { only_integer: true, greater_than: 0 }
  validates :water_type, inclusion: { in: %w[freshwater saltwater brackish] }
  validates :description, presence: true, length: { maximum: 500 }

  private

  # Custom content type validation for image
  def image_content_type_validation
    if image.attached? && !image.content_type.in?(%('image/png image/jpg image/jpeg image/gif'))
      errors.add(:image, 'must be a PNG, JPG, JPEG, or GIF')
    end
  end

  # Custom size validation for image
  def image_size_validation
    if image.attached? && image.byte_size > 5.megabytes
      errors.add(:image, 'should be less than 5MB')
    end
  end

  # Check if image is attached to reduce repeated calls in validations
  def image_attached?
    image.attached?
  end
end

def image_content_type_validation
  if image.attached? && !image.content_type.in?(%w[image/png image/jpg image/jpeg image/gif])
    errors.add(:image, 'must be a PNG, JPG, JPEG, or GIF')
    image.purge # Remove the invalid file
  end
end

class Customer < ApplicationRecord
    has_many :transactions, dependent: :destroy
end

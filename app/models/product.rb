class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :category

  validates :title, presence: true, length: { in: 2..100 }
end

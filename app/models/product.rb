# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :category

  validates :title, presence: true, length: { in: 2..100 }
  validates :description, presence: true, length: { in: 5..2_000 }
  validates :price, presence: true, numericality: { other_than: 0 }
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :in_stock, presence: true
end

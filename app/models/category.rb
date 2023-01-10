# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :products, dependent: :restrict_with_exception

  validates :description, presence: true, length: { in: 3..50 }, uniqueness: true
end

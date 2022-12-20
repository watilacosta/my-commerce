# frozen_string_literal: true

class Brand < ApplicationRecord
  has_many :products, dependent: :restrict_with_exception

  validates :description, presence: true, length: { in: 2..100 }
end

# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :restrict_with_exception

  enum status: {
    open: 0
  }
end

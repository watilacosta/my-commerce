# frozen_string_literal: true

class ProductSerializer
  include JSONAPI::Serializer

  attributes :title, :price, :quantity, :in_stock

  attribute :brand do |object|
    object.brand.description
  end

  attribute :category do |object|
    object.category.description
  end
end

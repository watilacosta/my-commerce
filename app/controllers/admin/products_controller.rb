# frozen_string_literal: true

module Admin
  class ProductsController < AdminController
    def index
      products = authorize Product.includes(%i[brand category])
                                  .order(description: :asc)

      render json: serialize(products, ProductSerializer), status: :ok
    end
  end
end

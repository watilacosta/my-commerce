# frozen_string_literal: true

module StoreFront
  class HomeController < BaseController
    include SerializeResponse

    def index
      products = Product.includes(%i[brand category]).all
      render json: { users: serialize(products, ProductSerializer) }, status: :ok
    end
  end
end

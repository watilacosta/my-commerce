# frozen_string_literal: true

module Admin
  class BrandsController < AdminController
    def index
      brands = authorize Brand.order(description: :asc)

      render json: serialize(brands, BrandSerializer), status: :ok
    end
  end
end

# frozen_string_literal: true

module Admin
  class ProductsController < AdminController
    def index
      products = authorize Product.includes(%i[brand category])

      render json: serialize(products, ProductSerializer), status: :ok
    end

    def create
      authorize Product
      result = Products::CreateProduct.call(product_params:)

      if result.success?
        render json: serialize(result.product, ProductSerializer), status: :created
      else
        render json: { errors: result.errors }, status: :unprocessable_entity
      end
    end

    private

    def product_params
      params.require(:product)
            .permit(:title, :description, :price, :quantity, :in_stock, brand_attributes: :description,
                                                                        category_attributes: :description)
    end
  end
end

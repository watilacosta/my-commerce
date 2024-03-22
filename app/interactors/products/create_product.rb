# frozen_string_literal: true

module Products
  class CreateProduct
    include Interactor

    def call
      product = Product.new(context.product_params)

      if product.save
        context.product = product
      else
        context.fail!(errors: product.errors.full_messages)
      end
    end
  end
end

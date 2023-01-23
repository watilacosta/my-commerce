# frozen_string_literal: true

module StoreFront
  class OrdersController < BaseController
    def create
      items = permitted_params[:items]

      ActiveRecord::Base.transaction do
        amount = 0
        # Create Order
        @order = Order.create!(user_id: permitted_params[:user_id], amount:)

        # Create all OrderItems
        items.each do |item|
          product_id = item[:product_id]
          quantity = item[:quantity]
          unit_price = item[:unit_price]

          order_item_total_price = unit_price * quantity

          OrderItem.create!(
            product_id:,
            order_id: @order.id,
            quantity:,
            total_price: order_item_total_price
          )
        end

        # Upgrade order amount
        amount += @order.order_items.sum(:total_price)

        @order.update!(amount:)
      end

      render json: { order: @order }
    end

    private

    def permitted_params
      params.permit(:user_id, items: %i[product_id unit_price quantity])
    end
  end
end

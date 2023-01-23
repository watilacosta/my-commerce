class CreateOrderItems
  include Interactor

  def call
    context.fail! unless (context.order_items = create_order_items)
  end

  private

  def create_order_items
    context.fail!(error: 'Items are required')  unless context.items.present?

    context.items.each do |item|
      unit_price = item[:unit_price]
      quantity = item[:quantity]

      OrderItem.create!(
        product_id: item[:product_id],
        order_id: context.order.id,
        quantity:,
        total_price: unit_price * quantity
      )
    end
  end
end

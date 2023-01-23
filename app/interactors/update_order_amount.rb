class UpdateOrderAmount
  include Interactor

  def call
    context.amount += context.order.order_items.sum(:total_price)

    context.order.update!(amount: context.amount)
  end
end

class CreateOrder
  include Interactor

  def call
    context.amount = 0
    context.fail! unless create_order
  end

  private

  def create_order
    context.order = Order.create(user_id: context.user_id, amount: context.amount)
  end
end

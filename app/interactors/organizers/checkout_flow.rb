module Organizers
  class CheckoutFlow
    include Interactor::Organizer

    organize CreateOrder, CreateOrderItems, UpdateOrderAmount
  end
end

# frozen_string_literal: true

module Organizers
  class CheckoutFlow
    include Interactor::Organizer

    organize CreateOrder, CreateOrderItems, UpdateOrderAmount
  end
end

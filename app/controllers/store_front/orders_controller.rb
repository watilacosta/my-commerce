# frozen_string_literal: true

module StoreFront
  class OrdersController < BaseController
    def create
      user_id = permitted_params[:user_id]
      items =  permitted_params[:items]
      result = Organizers::CheckoutFlow.call(user_id:, items:)

      render json: if result.success?
                     { order: result.order } # TODO: serializer order
                   else
                     { error: result.error }
                   end
    rescue ActiveRecord::RecordInvalid, ActiveRecord::RecordNotFound => e
      render json: { error: e.message }
    end

    private

    def permitted_params
      @permitted_params ||= params.permit(
        :user_id,
        items: %i[product_id unit_price quantity]
      )
    end
  end
end

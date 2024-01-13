# frozen_string_literal: true

module StoreFront
  class OrdersController < BaseController
    def create
      result = Organizers::CheckoutFlow.call(permitted_params[:user_id], permitted_params[:items])

      # TODO: serializer order
      render json: result.success? ? { order: result.order } : { error: result.error }
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

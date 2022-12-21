# frozen_string_literal: true

class ApplicationController < ActionController::API
  def authorize_resource
    header = request.headers['Authorization']

    @decoded = JwtToken.decode(header).symbolize_keys!
    @current_user = User.find(@decoded[:user_id])
  rescue ActiveRecord::RecordNotFound => e
    render json: { errors: e.message }, status: :unauthorized
  rescue JWT::EncodeError => encoder_error
    render json: { errors: encoder_error.message }, status: :unauthorized
  end
end

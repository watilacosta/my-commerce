# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Pundit::Authorization

  after_action :verify_authorized

  attr_reader :current_user

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def authorize_resource
    header = request.headers['Authorization']

    @decoded = JwtToken.decode(header).symbolize_keys!
    @current_user = User.find(@decoded[:user_id])
  rescue ActiveRecord::RecordNotFound, JWT::VerificationError => e
    render json: { errors: e.message }, status: :unauthorized
  end

  private

  def user_not_authorized
    render json: { error: 'You are not authorized to perform this action.' }
  end
end

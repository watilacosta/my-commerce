# frozen_string_literal: true

class AuthController < ApplicationController
  before_action :authorize_resource, except: :login

  # POST auth/login
  def login
    user = User.find_by_email!(login_params[:email])

    user&.authenticate(login_params[:password])
    token = JwtToken.encode(user_id: user.id)

    render json: { token: token }, status: :ok
  rescue ActiveRecord::RecordNotFound => e
    Rails.logger.error e.message
    render json: { error: 'User not found!' }, status: :unauthorized
  rescue JWT::EncodeError => e
    Rails.logger.error e.message
    render json: { error: 'Unauthorized!' }, status: :unauthorized
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end

# frozen_string_literal: true

class AuthController < ApplicationController
  before_action :authorize_resource, except: :login

  # POST auth/login
  def login
    user = User.find_by_email!(login_params[:email])
    if user&.authenticate(login_params[:password])
      token = JwtToken.encode(user_id: user.id)

      render json: { token: token }, status: :ok
    end
  rescue ActiveRecord::RecordNotFound, JWT::EncodeError => e
    render json: { error: e.message }, status: :unauthorized
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end

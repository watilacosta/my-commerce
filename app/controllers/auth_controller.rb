# frozen_string_literal: true

class AuthController < ApplicationController
  before_action :authorize_resource, except: :login
  after_action :verify_authorized, except: :login

  # POST auth/login
  def login
    user = User.find_by!(email: permitted_params[:email])

    if user&.authenticate(permitted_params[:password])
      token = JwtToken.encode(user_id: user.id)

      render json: { token: }, status: :ok
    end
  rescue ActiveRecord::RecordNotFound, JWT::EncodeError => e
    render json: { error: e.message }, status: :unauthorized
  end

  private

  def permitted_params
    @permitted_params ||= params.require(:auth).permit(:email, :password)
  end
end

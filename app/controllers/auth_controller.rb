# frozen_string_literal: true

class AuthController < ApplicationController
  include SerializeResponse

  before_action :authorize_resource, except: %i[login sign_up confirm_user_access]
  after_action :skip_authorization_method, only: %i[login sign_up confirm_user_access]

  # POST /auth/login
  def login
    user = User.find_by!(email: permitted_params[:email])

    if user&.authenticate(permitted_params[:password])
      token = JwtToken.encode(user_id: user.id)

      render json: { token: }, status: :ok
    end
  rescue ActiveRecord::RecordNotFound, JWT::EncodeError => e
    render json: { error: error_message(e) }, status: :unauthorized
  end

  # POST /auth/sign_up
  def sign_up
    result = Organizer::SignUp.call(permitted_params)
    user_serialized = serialize(result.user, UserSerializer)

    render json: { user: user_serialized }, status: :created
  rescue ActiveRecord::RecordInvalid, Interactor::Failure => e
    render json: { error: e.message }
  end

  def confirm_user_access
    response = Organizer::ReleaseUserAccountAccess.call(permitted_params)
    message = response.failure? ? response.error : 'Acesso liberado!'

    render json: { message: message }
  rescue ActiveRecord::RecordNotFound => e
    render json: { message: e.message }
  end

  private

  def skip_authorization_method
    skip_authorization
  end

  def error_message(error)
    return error.message unless error.instance_of?(ActiveRecord::RecordNotFound)

    Rails.logger.error(error.message)
    'Não autorizado. Verifique se seu email e senha estão corretos'
  end

  def permitted_params
    @permitted_params ||= params.require(:auth).permit(
      :email, :password, :user_email, :confirmation_code
    )
  end
end

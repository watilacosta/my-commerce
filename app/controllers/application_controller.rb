# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ActionView::Helpers::TranslationHelper
  include Pundit::Authorization

  after_action :verify_authorized

  attr_reader :current_user

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def authorize_resource
    header = request.headers['Authorization']

    @decoded = JwtToken.decode(header).symbolize_keys!
    @current_user = User.find(@decoded[:user_id])
  rescue ActiveRecord::RecordNotFound, JWT::ExpiredSignature => e
    render json: { errors: e.message }, status: :unauthorized
  end

  private

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore

    render json: { error: t("pundit.#{policy_name}.#{exception.query}") },
           scope: 'pundit', default: :default, status: :unauthorized
  end
end

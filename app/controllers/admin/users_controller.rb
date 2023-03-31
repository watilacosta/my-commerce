# frozen_string_literal: true

module Admin
  class UsersController < AdminController
    def index
      users = authorize User.order(id: :asc)

      render json: users, status: :ok
    end

    def update
      authorize User
      result = UpdateUser.call(id: params[:id], user_params:)

      render json: result.user, status: :ok
    rescue ActiveRecord::RecordNotFound, ActiveRecord::RecordInvalid => e
      render json: { error: e.message }, status: :unprocessable_entity
    end

    private

    def user_params
      params.require(:user).permit(:id, :firstname, :lastname, :email, :profile, :active)
    end
  end
end

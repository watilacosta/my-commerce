# frozen_string_literal: true

module Admin
  class UsersController < AdminController
    def index
      users = authorize User.order(id: :asc)

      render json: users, status: :ok
    end

    def edit
      user = authorize User.find(params[:id])

      render json: user, status: :ok
    end
  end
end

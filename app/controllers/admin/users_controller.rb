# frozen_string_literal: true

module Admin
  class UsersController < AdminController
    def index
      users = authorize User.order(id: :asc)

      render json: users, status: 200
    end
  end
end

# frozen_string_literal: true

module Admin
  class UsersController < AdminController
    def index
      users = User.all
      authorize users

      render json: serialize(users, UserSerializer), status: :ok
    end
  end
end

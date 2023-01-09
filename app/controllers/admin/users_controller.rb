# frozen_string_literal: true

module Admin
  class UsersController < ApplicationController
    before_action :authorize_resource

    def index
      users = User.all
      authorize users
      users_serialized = UserSerializer.new(users).serializable_hash

      render json: users_serialized, status: :ok
    end
  end
end

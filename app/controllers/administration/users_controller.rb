module Administration
  class UsersController < ApplicationController
    before_action :authorize_resource

    def index
      users = User.all

      render json: users, status: :ok
    end
  end
end

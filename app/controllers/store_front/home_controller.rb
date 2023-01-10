# frozen_string_literal: true

module StoreFront
  class HomeController < BaseController
    def index
      render json: { welcome: 'Welcome to store!' }
    end
  end
end

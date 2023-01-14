# frozen_string_literal: true

module Admin
  class AdminController < ApplicationController
    before_action :authorize_resource

    include SerializeResponse
  end
end

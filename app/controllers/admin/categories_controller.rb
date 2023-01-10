# frozen_string_literal: true

module Admin
  class CategoriesController < ApplicationController
    include SerializeResponse

    def create
      category = Category.create!(category_params)
      category_serialized = serialize(category, CategorySerializer)

      render json: category_serialized, status: :created
    rescue ActiveRecord::RecordInvalid => e
      render json: { error: e.message }, status: :bad_request
      Rails.logger.error e
    end

    private

    def category_params
      params.require(:category).permit(:description)
    end
  end
end

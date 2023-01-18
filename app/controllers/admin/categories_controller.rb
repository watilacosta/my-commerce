# frozen_string_literal: true

module Admin
  class CategoriesController < AdminController
    def index
      categories = authorize Category.order(description: :asc)

      render json: serialize(categories, CategorySerializer), status: :ok
    end

    def create
      category = authorize Category.new(category_params)
      category.save!
      category_serialized = serialize(category, CategorySerializer)

      render json: category_serialized, status: :created
    rescue ActiveRecord::RecordInvalid => e
      render json: { error: e.message }, status: :bad_request
      Rails.logger.error e
    end

    def update
      category = authorize Category.find(params[:id])
      category.update!(category_params)

      render json: serialize(category, CategorySerializer), status: :no_content
    rescue ActiveRecord::RecordNotFound, ActiveRecord::RecordInvalid => e
      render json: { error: e.message }, status: :unprocessable_entity
    end

    private

    def category_params
      params.require(:category).permit(:description)
    end
  end
end

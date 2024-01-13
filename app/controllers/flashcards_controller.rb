class FlashcardsController < ApplicationController
  before_action :authorize_resource

  def create
    authorize Flashcard
    result = CreateFlashcard.call(flashcard_params.merge(user_id: current_user.id))

    if result.success?
      render json: result.flashcard, status: :created
    else
      render json: result.flashcard.errors, status: :unprocessable_entity
    end
  end

  private

  def flashcard_params
    params.require(:flashcard).permit(:question, :response, :user_id)
  end
end
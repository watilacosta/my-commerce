class CreateFlashcard
  include Interactor

  def call
    context.fail! unless create_flashcard
  end

  private

  def create_flashcard
    context.flashcard = Flashcard.create(
      question: context.question,
      response: context.response,
      user_id: context.user_id
    )
  end
end
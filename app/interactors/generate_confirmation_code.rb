# frozen_string_literal: true

class GenerateConfirmationCode
  include Interactor

  def call
    context.confirmation_code = SecureRandom.alphanumeric(8)

    context.fail! unless ConfirmationCodeUser.create(user_id: context.user.id,
                                                     code: context.confirmation_code)
  end
end

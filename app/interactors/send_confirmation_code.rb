# frozen_string_literal: true

class SendConfirmationCode
  include Interactor

  def call
    user = context.user
    confirmation_code = context.confirmation_code

    UserMailer.with(user: user, confirmation_code: confirmation_code)
              .release_access_code
              .deliver_later
  end
end

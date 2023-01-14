class SendConfirmationCode
  include Interactor

  def call
    user, confirmation_code = [context.user, context.confirmation_code]

    UserMailer.with(user: user, confirmation_code: confirmation_code)
              .confirmation_email_code
              .deliver_later
  end
end

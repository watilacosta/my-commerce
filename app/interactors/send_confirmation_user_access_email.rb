# frozen_string_literal: true

class SendConfirmationUserAccessEmail
  include Interactor

  def call
    UserMailer.with(user: context.user)
              .confirmation_access.deliver_later
  end
end

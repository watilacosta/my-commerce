# frozen_string_literal: true

class SignUp
  include Interactor::Organizer

  organize CreateAccount, GenerateConfirmationCode, SendConfirmationCode
end

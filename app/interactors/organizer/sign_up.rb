# frozen_string_literal: true

module Organizer
  class SignUp
    include Interactor::Organizer

    organize CreateAccount, GenerateConfirmationCode, SendConfirmationCode
  end
end

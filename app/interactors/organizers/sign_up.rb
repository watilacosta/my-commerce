# frozen_string_literal: true

module Organizers
  class SignUp
    include Interactor::Organizer

    organize CreateAccount, GenerateConfirmationCode, SendConfirmationCode
  end
end

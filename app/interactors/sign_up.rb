class SignUp
  include Interactor::Organizer

  organize CreateAccount, GenerateConfirmationCode, SendConfirmationCode
end

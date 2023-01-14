class GenerateConfirmationCode
  include Interactor

  def call
    context.confirmation_code = SecureRandom.alphanumeric(8)
  end
end

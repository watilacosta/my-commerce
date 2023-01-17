# frozen_string_literal: true

class CreateAccount
  include Interactor

  def call
    user = User.create!(email: context.email, password: context.password)
    context.fail! unless user.persisted?

    context.user = user
  end
end

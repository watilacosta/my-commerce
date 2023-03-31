# frozen_string_literal: true

class UpdateUser
  include Interactor

  def call
    context.user = User.find(context.id)
    user_params = context.user_params
                         .to_hash
                         .symbolize_keys!

    context.user.update!(user_params)
  end
end

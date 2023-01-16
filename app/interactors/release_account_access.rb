class ReleaseAccountAccess
  include Interactor

  def call
    context.user = User.find_by_email!(context.user_email)

    context.fail!(error: "Usuário já confirmado anteriormente") if context.user.confirmed_at?

    context.user.update(confirmed_at: DateTime.now)
  end
end

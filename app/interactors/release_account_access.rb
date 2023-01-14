class ReleaseAccountAccess
  include Interactor

  def call
    context.user = User.find_by_email!(context.user_email)
    context.user.update(confirmed_at: DateTime.now)
  end
end

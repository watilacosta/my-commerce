# frozen_string_literal: true

class UpdateUserConfirmedAt
  include Interactor

  def call
    find_user
    context_fail_to_user_confirmed
    release_user_access
  end

  private

  def find_user
    context.user = User.find_by!(email: context.user_email)
  end

  def context_fail_to_user_confirmed
    return unless context.user.confirmed_at?

    # TODO: adicionar msg ao i18n
    context.fail!(error: 'Usuário já confirmado anteriormente')
  end

  def release_user_access
    # TODO: adicionar msg ao i18n
    context.fail!(error: 'Código incorreto!') unless confirmation_code_correct?

    context.user.update(confirmed_at: DateTime.now, active: true)
  end

  def confirmation_code_correct?
    context.user.confirmation_code_user.code.eql?(context.confirmation_code)
  end
end

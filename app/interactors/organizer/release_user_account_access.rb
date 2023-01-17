# frozen_string_literal: true

class ReleaseUserAccountAccess
  include Interactor::Organizer

  organize UpdateUserConfirmedAt, SendConfirmationUserAccessEmail
end

# frozen_string_literal: true

module Organizer
  class ReleaseUserAccountAccess
    include Interactor::Organizer

    organize UpdateUserConfirmedAt, SendConfirmationUserAccessEmail
  end
end

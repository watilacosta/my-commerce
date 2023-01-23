# frozen_string_literal: true

module Organizers
  class ReleaseUserAccountAccess
    include Interactor::Organizer

    organize UpdateUserConfirmedAt, SendConfirmationUserAccessEmail
  end
end

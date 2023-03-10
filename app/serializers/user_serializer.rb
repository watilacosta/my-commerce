# frozen_string_literal: true

class UserSerializer
  include JSONAPI::Serializer

  attributes :firstname, :lastname, :email, :profile, :status
end

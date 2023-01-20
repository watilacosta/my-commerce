# frozen_string_literal: true

class BrandSerializer
  include JSONAPI::Serializer

  attributes :description
end

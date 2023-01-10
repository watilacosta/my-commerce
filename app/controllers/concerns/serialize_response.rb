# frozen_string_literal: true

require 'active_support/concern'

module SerializeResponse
  extend ActiveSupport::Concern

  def serialize(record, serializer)
    serializer.new(record).serializable_hash
  end
end

# frozen_string_literal: true

class ConfirmationCodeUser < ApplicationRecord
  belongs_to :user

  validates :code, presence: true
end

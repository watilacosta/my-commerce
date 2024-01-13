require 'rails_helper'

RSpec.describe Flashcard, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:question) }
    it { is_expected.to validate_presence_of(:response) }
    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_length_of(:question).is_at_least(1).is_at_most(50) }
    it { is_expected.to validate_length_of(:response).is_at_least(1).is_at_most(1000) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end
end

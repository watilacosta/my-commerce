require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_length_of(:title).is_at_most(100).is_at_least(2) }
  end

  describe 'relationships' do

  end
end

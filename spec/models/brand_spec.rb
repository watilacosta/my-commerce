require 'rails_helper'

RSpec.describe Brand, type: :model do
  describe 'Validations' do
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_length_of(:description).is_at_most(100).is_at_least(2) }
  end

  describe 'Associations' do
    it { is_expected.to have_many(:products).dependent(:restrict_with_exception) }
  end
end

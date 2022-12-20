require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'Validations' do
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_length_of(:description).is_at_most(50).is_at_least(3) }
  end

  describe 'Associations' do
    it { is_expected.to have_many(:products).dependent(:restrict_with_exception) }
  end
end

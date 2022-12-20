require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_length_of(:title).is_at_most(100).is_at_least(2) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_length_of(:description).is_at_least(5).is_at_most(2_000) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_numericality_of(:price).is_other_than(0) }
    it { is_expected.to validate_presence_of(:quantity) }
    it { is_expected.to validate_numericality_of(:quantity).is_greater_than_or_equal_to(0) }
    it { is_expected.to validate_presence_of(:in_stock) }
  end

  describe 'relationships' do
    it { is_expected.to belong_to :brand }
    it { is_expected.to belong_to :category }
  end
end

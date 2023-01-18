require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    let(:profiles) { [:customer, :admin] }
    let(:statuses) { [:inactive, :active] }

    subject { create(:user) }

    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }
    it { is_expected.to validate_length_of(:email).is_at_least(6).is_at_most(100) }
    it { is_expected.to validate_presence_of(:password_digest) }
    it { is_expected.to validate_length_of(:password_digest).is_at_least(8).is_at_most(100) }
    it { is_expected.to define_enum_for(:profile).with_values(profiles) }
    it { is_expected.to define_enum_for(:status).with_values(statuses) }
    it { is_expected.to validate_length_of(:firstname).is_at_most(50) }
    it { is_expected.to validate_length_of(:lastname).is_at_most(50) }
  end
end

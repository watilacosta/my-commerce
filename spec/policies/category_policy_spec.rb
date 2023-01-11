require 'rails_helper'

describe CategoryPolicy do
  subject { described_class }
  let(:user) { create(:user) }

  permissions :create? do
    it 'denies access unless user is admin' do
      expect(subject).not_to permit(user)
    end
  end
end

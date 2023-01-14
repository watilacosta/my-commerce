require 'rails_helper'

describe CategoryPolicy do
  subject { described_class }
  let(:user) { create(:user) }

  permissions :index? do
    it 'denies access unless user is admin' do
      expect(subject).not_to permit(user)
    end
  end

  permissions :create? do
    it 'denies access unless user is admin' do
      expect(subject).not_to permit(user)
    end
  end

  permissions :update? do
    it 'denies access unless user is admin' do
      expect(subject).not_to permit(user)
    end
  end
end

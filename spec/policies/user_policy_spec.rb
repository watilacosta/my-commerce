require 'rails_helper'

describe UserPolicy do
  subject { described_class }

  permissions :index? do
    it 'denies access unless user is admin' do
      expect(subject).not_to permit(User.new(profile: :customer))
    end

    it 'denies access if user is not active' do
      expect(subject).not_to permit(User.new(status: :inactive))
    end

    it 'grants access if user is admin and active' do
      expect(subject).to permit(User.new(profile: :admin, status: :active))
    end
  end
end

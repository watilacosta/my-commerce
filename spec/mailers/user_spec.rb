require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  pending "add some examples to (or delete) #{__FILE__}"
end


RSpec.describe UserMailer, type: :mailer do
  describe '#release_access_code' do
    let(:user) { create(:user) }
    let(:confirmation_code) { '123456' }

    subject { described_class.release_access_code(user: user, confirmation_code: confirmation_code).deliver_now }

    it 'sends an email to the user' do
      expect(subject.to).to eq [user.email]
    end

    it 'has the correct subject' do
      expect(subject.subject).to eq 'mailer.user.confirmation_code'
    end

    it 'includes the confirmation code' do
      expect(subject.body.encoded).to include confirmation_code
    end
  end

  describe '#confirmation_access' do
    let(:user) { create(:user) }

    subject { described_class.confirmation_access(user: user).deliver_now }

    it 'sends an email to the user' do

    end
  end
end

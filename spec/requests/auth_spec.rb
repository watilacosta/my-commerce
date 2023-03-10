require 'rails_helper'

RSpec.describe "Auths", type: :request do
  describe "POST /login" do

    context 'when logging is success' do
      let(:user) { create(:active_admin) }

      before(:each) do
        post "/auth/login", params: {
          auth: {
            email: user[:email],
            password: '12345678'
          }
        }
      end

      it "returns http success" do
        expect(response).to have_http_status(:ok)
      end

      it 'returns token' do
        expect(JSON.parse(response.body)['token']).to_not be_nil
       end
    end

    context 'when logging is fail' do
      before(:each) do
        post "/auth/login", params: {
          auth: {
            email: 'fake-email@fakehost.com',
            password: '12345678'
          }
        }
      end

      describe 'User not found' do
        it 'returns http unauthorized' do
          expect(response).to have_http_status(:unauthorized)
        end

        it 'returns json with error' do
          expect(JSON.parse(response.body)['error']).to_not be_nil
        end
      end
    end
  end
end

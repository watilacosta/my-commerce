# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admin::Users' do
  describe 'GET /index' do
    context 'when user is admin' do
      let(:user) { create(:active_admin) }

      let(:expected_response) do
        {
          data: [
            {
              id: user.id.to_s,
              type: 'user',
              attributes: {
                firstname: user.firstname,
                lastname: user.lastname,
                email: user.email,
                profile: user.profile,
                status: user.status
              }
            }
          ]
        }
      end

      before do
        post '/auth/login', params: { auth: { email: user.email, password: '12345678' } }
        get admin_users_path, headers: { Authorization: JSON.parse(response.body)['token'] }
      end

      it 'returns http status ok', :aggregate_failures do
        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)).to include_json(expected_response)
      end
    end

    context "when user isn't logged in" do
      before do
        fake_token = 'eyJhbGciOiJIUzI1NiJ9.fsaidhsbidsaiasd.dsaliuhdbasidnbisa'
        get admin_users_path, headers: { Authorization: fake_token }
      end

      it 'returns http status unauthorized', :aggregate_failures do
        expect(response).to have_http_status(:unauthorized)
        expect(JSON.parse(response.body)).to include_json(
          { errors: 'Signature verification failed' }
        )
      end
    end
  end
end

require 'rails_helper'

RSpec.describe 'Admin::Users', type: :request do
  describe 'GET /index' do
    let(:user) { create(:active_admin) }

    before(:each) do
      post '/auth/login', params: { email: user.email, password: '12345678' }
      get admin_users_path, headers: { Authorization: JSON.parse(response.body)['token'] }
    end

    context 'when user is admin' do
      it 'returns http status ok' do
        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)).to include_json(
         {
           "data": [
             {
               "id": user.id.to_s,
               "type": "user",
               "attributes": {
                 "firstname": user.firstname,
                 "lastname": user.lastname,
                 "email": user.email,
                 "profile": user.profile,
                 "status": user.status
               }
             }
           ]
         }
        )
      end
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'
include JsonResponse

RSpec.describe 'Admin::Users' do
  describe 'GET /index' do
    context 'when user is admin' do
      let(:user) { create(:active_admin) }

      let(:expected_response) do
        [
          {
            id: user.id,
            firstname: user.firstname,
            lastname: user.lastname,
            email: user.email,
            profile: user.profile,
            active: user.active
          }
        ]
      end

      before do
        post '/auth/login', params: { auth: { email: user.email, password: '12345678' } }
        get admin_users_path, headers: { Authorization: JSON.parse(response.body)['token'] }
      end

      it 'returns http status ok' do
        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)).to include_json(expected_response)
      end
    end

    context "when user isn't admin" do
      let(:customer_user) { create(:user) }

      before do
        post '/auth/login', params: { auth: { email: customer_user.email, password: '12345678' } }
        get admin_users_path, headers: { Authorization: JSON.parse(response.body)['token'] }
      end

      it 'returns http status unauthorized' do
        expect(response).to have_http_status(:unauthorized)
        expect(JSON.parse(response.body)).to include_json(
          { error: 'Você não está autorizado à listar usuários!' }
        )
      end
    end
  end

  describe 'PUT /update' do
    let(:admin) { create(:active_admin) }
    let(:customer) { create(:user) }
    let(:uri) { "/admin/users/#{customer.id}" }
    let(:attributes) {
      {
        "firstname": "Firstname",
        "lastname": "Lastname",
        "email": "customer@email.com",
        "profile": "admin",
        "active": true
      }
    }

    before do
      post '/auth/login', params: { auth: { email: admin.email, password: '12345678' } }
      put uri, params: attributes, headers: { Authorization: JSON.parse(response.body)['token'] }
    end

    context 'when customer is updated' do
      it 'returns http status success' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns corrects user updated attributes' do
        expect(json_attributes(response)).to include_json(attributes)
      end
    end

    context "when customer isn't exists" do
      let(:uri) { "/admin/users/0" }

      it 'returns http status unprocessable_entity' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns error message json' do
        expect(error_message(response)).to eq("Couldn't find User with 'id'=0")
      end
    end

    context 'when some attributes is not valid' do
      let(:attributes) { { "email": nil } }

      it "returns http status unprocessable_entity" do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it "returns error message json" do
        expect(error_message(response)).to include("A validação falhou")
      end
    end
  end
end

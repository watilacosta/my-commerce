# frozen_string_literal: true

require 'rails_helper'
include JsonResponse

RSpec.describe 'Admin::Categories', type: :request do
  before do
    user = create(:active_admin)
    post '/auth/login', params: { auth: { email: user.email, password: '12345678' } }
  end

  let(:headers) { { Authorization: JSON.parse(response.body)['token'] } }
  let(:category_attributes) { attributes_for(:category) }
  let(:description) { category_attributes[:description] }

  describe 'POST /create' do
    context 'when category is created' do
      before do
        post admin_categories_path,
             params: { category: category_attributes },
             headers: headers
      end

      it 'returns http status :created' do
        expect(response).to have_http_status(:created)
      end

      it 'returns correct category description' do
        expect(json_attributes(response)['description']).to eq(description)
      end
    end

    context 'when category is not created' do
      before do
        post admin_categories_path,
             params: { category: { description: '' } },
             headers: headers
      end

      it 'returns http status bad_request' do
        expect(response).to have_http_status(:bad_request)
      end

      it 'returns json with error_message' do
        expect(error_message(response)).to_not be_nil
      end
    end
  end

  describe 'GET /index' do
    context 'when has some categories' do
      let!(:categories) { create_list(:category, 10) }

      before { get admin_categories_path, headers: headers }

      it 'returns http status :ok' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns all categories' do
        expect(json_collection(response).count).to eq(categories.count)
      end
    end
  end

  describe 'PUT /update' do
    context 'when category is updated' do
      let!(:category) { create(:category, description: 'Something') }
      let(:new_description) { 'New category' }

      before do
        put "/admin/categories/#{category.id}",
            params: { category: { description: new_description } },
            headers: headers

        category.reload
      end

      it 'expected returns no_content http_status' do
        expect(response).to have_http_status(:no_content)
      end

      it 'expected this category description is changed' do
        expect(category.description).to eq(new_description)
      end
    end

    context 'when category not updated' do
      let(:category) { create(:category) }
      let(:empty_description) { nil }

      before do
        put "/admin/categories/#{category.id}",
            params: { category: { description: empty_description } },
            headers: headers

        category.reload
      end

      it 'is returns unprocessable_entity http status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns message error' do
        expect(error_message(response)).to_not be_nil
      end
    end
  end
end

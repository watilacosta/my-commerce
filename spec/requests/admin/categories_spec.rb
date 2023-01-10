# frozen_string_literal: true

require 'rails_helper'
include JsonResponse

RSpec.describe 'Admin::Categories', type: :request do
  describe 'POST /create' do
    let(:category_attributes) { attributes_for(:category) }
    let(:description) { category_attributes[:description] }

    context 'when category is created' do
      before do
        post admin_categories_path, params: { category: category_attributes }
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
        post admin_categories_path, params: { category: { description: '' } }
      end

      it 'returns http status bad_request' do
        expect(response).to have_http_status(:bad_request)
      end

      it 'returns json with error_message' do
        expect(error_message(response)).to_not be_nil
      end
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

module Api
  module V1
    RSpec.describe ShortenerLinksController, type: :controller do
      describe 'POST #create' do
        context 'when sending a valid URL' do
          it 'returns http success' do
            post :create, params: { shortener_link: { original_url: 'https://tiarly.dev' } }
            link = ShortenerLink.last
            expect(response).to have_http_status :success
            expect(response.content_type).to eq 'application/json; charset=utf-8'
            expect(response.body).to eq ShortenerLinkSerializer.new(link).attributes.to_json.to_s
          end
        end

        context 'when sending a NOT valid URL' do
          it 'returns http unprocessable_entity' do
            link = build(:shortener_link, original_url: 'https://tiarly. dev')
            post :create, params: { shortener_link: { original_url: link.original_url } }
            expect(response).to have_http_status :unprocessable_entity
            link.validate
            errors = { errors: { **link.errors } }.to_json.to_s
            expect(response.body).to eq errors
          end
        end
      end

      describe 'GET #show' do
        context 'when the token is found' do
          let!(:link) { create(:shortener_link) }
          it 'redirects to the original_url' do
            get :show, params: { token: link.token }
            expect(response).to redirect_to link.original_url
          end
        end

        context 'when the token is NOT found' do
          it 'returns not found' do
            get :show, params: { token: 'not_found_token' }
            expect(response).to have_http_status(:not_found)
          end
        end
      end
    end
  end
end

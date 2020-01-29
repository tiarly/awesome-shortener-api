# frozen_string_literal: true

require 'rails_helper'

module ShortenerLinks
  describe Finder do
    context '#call' do
      subject { described_class.call(token) }

      context 'when token already exists' do
        let!(:existing_link) { create(:shortener_link) }
        let(:token) { existing_link.token }

        it 'returns the existing link' do
          is_expected.to eq existing_link
        end

        it 'increments link count' do
          expect { subject }.to change { existing_link.reload.click_count }.by 1
        end
      end

      context 'when original_url does NOT exist' do
        let(:token) { 'non_existing_token' }

        it 'raises ActiveRecord::RecordNotFound' do
          expect { subject }.to raise_error ActiveRecord::RecordNotFound
        end
      end
    end
  end
end

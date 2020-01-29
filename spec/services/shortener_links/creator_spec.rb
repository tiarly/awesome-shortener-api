# frozen_string_literal: true

require 'rails_helper'

module ShortenerLinks
  describe Creator do
    context '#call' do
      subject { described_class.call(original_url) }

      context 'when original_url already exists' do
        let!(:existing_link) { create(:shortener_link) }
        let(:original_url) { existing_link.original_url }

        it 'returns the existing link' do
          is_expected.to eq existing_link
        end

        it 'does not create a new ShortenerLink' do
          expect { subject }.to change { ShortenerLink.count }.by 0
        end
      end

      context 'when original_url does NOT exist' do
        let(:original_url) { 'https://lexfox.com' }

        it 'creates a new ShortenerLink' do
          expect { subject }.to change { ShortenerLink.count }.by 1
        end

        context 'and it is an invalid url' do
          let(:original_url) { 'https:lexfox.com' }

          it 'does not create a new ShortenerLink' do
            response = subject
          rescue ActiveRecord::RecordInvalid
            expect { response }.to change { ShortenerLink.count }.by 0
          end

          it 'raises ActiveRecord::RecordInvalid' do
            expect { subject }.to raise_error ActiveRecord::RecordInvalid
          end
        end
      end
    end
  end
end

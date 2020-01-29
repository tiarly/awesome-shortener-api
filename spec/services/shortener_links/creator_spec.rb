# frozen_string_literal: true

require 'rails_helper'

module ShortenerLinks
  describe Creator do
    context '#call' do
      subject { described_class.call(link) }

      context 'when link already exists' do
        let!(:link) { create(:shortener_link) }

        it 'returns the existing link' do
          is_expected.to eq link
        end

        it 'does not create a new ShortenerLink' do
          expect { subject }.to change { ShortenerLink.count }.by 0
        end
      end

      context 'when link does NOT exist' do
        let(:link) { build(:shortener_link) }

        it 'creates a new ShortenerLink' do
          expect { subject }.to change { ShortenerLink.count }.by 1
        end

        context 'and it is an invalid url' do
          let(:link) { build(:shortener_link, original_url: 'https:lexfox.com') }

          it 'does not create a new ShortenerLink' do
            expect { subject }.to change { ShortenerLink.count }.by 0
          end

          it 'returns false' do
            is_expected.to eq false
          end
        end
      end
    end
  end
end

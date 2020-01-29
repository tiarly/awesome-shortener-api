# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ShortenerLink, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:original_url) }
    it { is_expected.to validate_presence_of(:token) }
    it { expect(build(:shortener_link)).to be_valid }
    it { expect(build(:shortener_link, :with_invalid_url)).to_not be_valid }
  end

  describe '.shortened_url' do
    subject { link.shortened_url }

    let(:link) { build(:shortener_link, token: token) }
    let(:token) { 'mytoken' }

    it 'returns the token url with the app domain' do
      is_expected.to eq "http://localhost:3000/#{token}"
    end
  end
end

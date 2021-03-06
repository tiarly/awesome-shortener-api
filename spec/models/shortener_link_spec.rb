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

  describe '.changed_testing_method_for_bors_merge' do
    subject { link.changed_testing_method_for_bors_merge }

    let(:link) { build(:shortener_link) }

    it { is_expected.to eq true }
  end

  describe '.second_call_to_testing_method_for_bors_merge' do
    subject { link.second_call_to_testing_method_for_bors_merge }

    let(:link) { build(:shortener_link) }

    it { is_expected.to eq true }
  end
end

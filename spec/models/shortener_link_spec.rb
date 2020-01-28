# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ShortenerLink, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:original_url) }
    it { is_expected.to validate_presence_of(:token) }
    it { expect(build(:shortener_link)).to be_valid }
    it { expect(build(:shortener_link, :with_invalid_url)).to_not be_valid }
  end
end

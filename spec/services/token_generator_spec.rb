# frozen_string_literal: true

require 'rails_helper'

describe TokenGenerator do
  subject { described_class.call }

  context '#call' do
    it 'returns a token with 8 chars' do
      expect(subject.size).to eq 8
    end

    it 'returns a token with only alphanumeric values' do
      alphanumeric_regex = /^[a-zA-Z0-9]*$/

      is_expected.to match alphanumeric_regex
    end
  end
end

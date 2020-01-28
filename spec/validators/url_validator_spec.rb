# frozen_string_literal: true

require 'rails_helper'

describe UrlValidator do
  subject do
    Class.new do
      include ActiveModel::Validations
      attr_accessor :url
      validates :url, url: true
    end.new
  end

  ['http://google.com', 'https://tiarly.dev', 'lexfox.com'].each do |valid_url|
    it "validates #{valid_url.inspect} as ia valid http url" do
      is_expected.to_not be_valid
    end
  end

  ['http://google', 'http://.com',
   'http://ftp://ftp.google.com', 'http://ssh://google.com'].each do |invalid_url|
    it "validates #{invalid_url.inspect} as NOT valid http url" do
      is_expected.to_not be_valid
    end
  end
end

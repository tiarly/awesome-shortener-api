# frozen_string_literal: true

module ShortenerLinks
  class Creator
    include Service

    def call(original_url)
      @original_url = original_url

      return existing_link if existing_link

      ShortenerLink.create!(
        original_url: original_url, token: generate_unique_token
      )
    end

    private

    attr_reader :original_url

    def existing_link
      @existing_link ||= ShortenerLink.find_by(original_url: original_url)
    end

    def generate_unique_token
      loop do
        token = TokenGenerator.call
        break token if ShortenerLink.where(token: token).empty?
      end
    end
  end
end

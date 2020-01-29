# frozen_string_literal: true

module ShortenerLinks
  class Creator
    include Service

    def call(shortener_link)
      @shortener_link = shortener_link

      return existing_link if existing_link

      shortener_link.token = generate_unique_token

      shortener_link.save
    end

    private

    attr_reader :shortener_link

    delegate :original_url, to: :@shortener_link

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

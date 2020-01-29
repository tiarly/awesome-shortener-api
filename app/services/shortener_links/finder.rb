# frozen_string_literal: true

module ShortenerLinks
  class Finder
    include Service

    def call(token)
      ShortenerLink.find_by!(token: token).tap do |link|
        link.increment!(:click_count, touch: true)
      end
    end
  end
end

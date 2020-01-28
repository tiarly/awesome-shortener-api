# frozen_string_literal: true

class ShortenerLink < ApplicationRecord
  validates :original_url, :token, presence: true
  validates :original_url, url: true
end

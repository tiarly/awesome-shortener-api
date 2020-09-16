# frozen_string_literal: true

class ShortenerLink < ApplicationRecord
  validates :original_url, :token, presence: true
  validates :original_url, url: true

  def shortened_url
    host_options = AwesomeShortenerApi::Application.config.default_url_options

    Rails.application.routes.url_helpers.link_url(token, host_options)
  end

  def changed_testing_method_for_bors_merge
    true
  end

  def second_call_to_testing_method_for_bors_merge
    changed_testing_method_for_bors_merge
  end
end

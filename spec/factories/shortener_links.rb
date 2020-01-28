# frozen_string_literal: true

FactoryBot.define do
  factory :shortener_link do
    original_url { 'https://google.com' }
    token { 'MyString' }
    click_count { 1 }

    trait :with_invalid_url do
      original_url { 'http:// .com' }
    end
  end
end

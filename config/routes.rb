# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :shortener_links, only: %i[create]
    end
  end

  get ':token', to: 'api/v1/shortener_links#show', as: :link
end

# frozen_string_literal: true

Rails.application.routes.draw do
  get '/:token', to: 'api/v1/shortener_links#show', as: :link

  namespace :api do
    namespace :v1 do
      resources :shortener_links, only: %i[create]
    end
  end
end

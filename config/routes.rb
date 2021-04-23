# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, format: false do
    namespace :v1, path: '/v1' do
      resources :campaigns, only: [:index, :index]
      resources :investments, only: [:index]
    end
  end
end

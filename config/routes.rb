# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, format: false do
    namespace :v1, path: '/v1' do
      resources :campaigns, only: [:index, :show] do
        member do
          post 'create_investment'
        end
      end
      resources :investments, only: [:create]
    end
  end
end

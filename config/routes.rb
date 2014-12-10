Scrumtracker::Application.routes.draw do
  get "sessions/new"
  namespace :api, defaults: { format: 'json' } do
    resources :projects, only: %i(index show)
    resources :stories, only: %i(index show)
  end

  root to: 'home#index'
end

Scrumtracker::Application.routes.draw do

  namespace :api, defaults: { format: 'json' } do
    resources :projects, only: %i(index show)
    resources :stories, only: %i(index show update create)
  end

  get "/login", to: 'sessions#new', as: :new_sessions
  post "/login", to: 'sessions#create', as: :create_sessions
  get '/logout', to: 'sessions#destroy', as: :destroy_sessions

  root to: 'home#index'
end

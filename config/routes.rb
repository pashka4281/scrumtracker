Scrumtracker::Application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    resources :projects, only: %i(index)
  end

  root to: 'home#index'
end

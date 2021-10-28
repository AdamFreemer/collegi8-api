Rails.application.routes.draw do
  root to: proc { [404, {}, ["Nothing to see here"]] }

  resources :items
  resources :users
  post 'authenticate', to: 'authentication#authenticate'
end

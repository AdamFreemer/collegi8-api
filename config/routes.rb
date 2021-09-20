Rails.application.routes.draw do
  resources :items
  resources :users
  post 'authenticate', to: 'authentication#authenticate'
end

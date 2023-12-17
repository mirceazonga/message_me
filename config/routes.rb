Rails.application.routes.draw do
  resources :messages, only: [:create]
  root 'chatrooms#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  post 'message', to: 'messages#create'

  mount ActionCable.server, at: '/cable'
end

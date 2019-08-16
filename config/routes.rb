Rails.application.routes.draw do
  root 'posts#index'

  resources :users
  get '/login' , to: 'sessions#new'
  post '/login' , to: 'sessions#create'
  delete '/signout' , to: 'sessions#destroy'
end

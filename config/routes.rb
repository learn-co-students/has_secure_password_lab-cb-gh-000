Rails.application.routes.draw do
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
#  post '/create' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  resources :users, only: [:new, :create, :show]
end

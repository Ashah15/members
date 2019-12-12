Rails.application.routes.draw do

  get  '/signup',  to: 'users#new'
	get '/login', to: 'sessions#new'
	post 'login', to: 'sessions#create'
	get '/logout', to: 'sessions#destroy'

  resources :users
  resources :posts, only: [:new, :create, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

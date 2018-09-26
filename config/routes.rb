Rails.application.routes.draw do
  get 'rooms/new'

  get 'rooms/create'

  get 'rooms/index'

  get 'rooms/show'

  get 'messages/Messages'

  get 'messages/new'

  get 'messages/create'

  get 'password_resets/new'

  get 'password_resets/edit'

	root   'static_pages#home'
  get    '/help',    to: 'static_pages#help'
  get    '/about',   to: 'static_pages#about'
  get    '/contact', to: 'static_pages#contact'
  get    '/login',   to: 'sessions#new'
	get		 '/signup',	 to: 'users#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
	resources :users do
		member do
			get :following, :followers
		end
	end
	resources :account_activations, only: [:edit]
	resources :password_resets, only: [:new, :create, :edit, :update]
	resources :microposts,          only: [:create, :destroy]
	resources :relationships,       only: [:create, :destroy]
	resources :messages, only: [:new, :create]
	resources :rooms, only: [:new, :create, :index, :show]




end

Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :products
  resources :orders, only: [:index, :show, :create, :destroy]

  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  post 'thank_you' => 'static_pages#thank_you'
  get 'featured' => 'static_pages#landing_page'
  root 'static_pages#index'

  as :user do
  	get 'login' => 'devise/sessions#new'
  end

  as :user do
  	get 'logout' => 'devise/sessions#destroy'
  end

  as :user do
  	get 'sign_up' => 'devise/registrations#new'
  end

end

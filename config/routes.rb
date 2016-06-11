Rails.application.routes.draw do
  devise_for :users, path: "auth", path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  resources :users
  resources :products do
    resources :comments
  end
  resources :orders, only: [:index, :show, :create, :destroy]

  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  post 'thank_you' => 'static_pages#thank_you'
  get 'featured' => 'static_pages#landing_page'
  root 'static_pages#index'

  as :user do
  	get 'login' => 'devise/sessions#new'
    get 'logout' => 'devise/sessions#destroy'
    get 'sign_up' => 'devise/registrations#new'
  end

end

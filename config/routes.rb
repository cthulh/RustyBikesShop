Rails.application.routes.draw do
  resources :products
  resources :orders, only: [:index, :show, :create, :destroy]
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  post '/thank_you', to: 'static_pages#thank_you'
  get '/featured', to: 'static_pages#landing_page'
  root 'static_pages#index'

end

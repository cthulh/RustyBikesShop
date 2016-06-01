Rails.application.routes.draw do
  resources :products
  resources :orders, only: [:index, :show, :create, :destroy]
  get 'static_pages/about'

  get 'static_pages/contact'

  get '/featured', to: 'static_pages#landing_page'

  root 'static_pages#index'

end

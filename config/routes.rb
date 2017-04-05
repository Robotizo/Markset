Rails.application.routes.draw do
  resources :categories
  resources :pages
  get 'pages/index'

  get 'pages/show'

  resources :posts
  get 'admin' => 'admin#index'


controller :sessions do
  get 'login' => :new
  post 'login' => :create
  delete 'logout' => :destroy
end

  resources :users
  resources :orders
  resources :carts
  get 'store/index'

  resources :line_items do
  	member do
  		get 'remove'
  		get 'add'
  	end
  end
  
  resources :products do
    get :who_bought, on: :member
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'store#index', as: 'store'
end

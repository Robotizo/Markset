Rails.application.routes.draw do

  resources :payments, only: [:new, :create]
  resources :charges, only: [:new, :create]
  resources :product_comments
  resources :comments
  resources :product_attachments
  resources :post_attachments
  resources :categories
  resources :pages
  get 'pages/index'

  get 'pages/show'

  resources :posts do
    resources :comments
  end

  
  get 'admin' => 'admin#index'

resources :relationships, only: [:create, :destroy]

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
    resources :product_comments
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'store#index', as: 'store'
end

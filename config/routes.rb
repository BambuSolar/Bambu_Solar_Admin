Rails.application.routes.draw do

  resources :ourworks

  resources :opinions

  resources :member_teams

  get 'home/landing'

  root 'home#landing'

  resources :product_types do
    resources :products do
      resources :product_pictures
    end
  end

  get 'signup'  => 'users#new'

  get 'login'  => 'sessions#new'

  post 'login' => 'sessions#create'

  delete 'logout' => 'sessions#destroy'

  resources :users

  get '/preview' => 'website/site#home', as: 'preview'

  get '/preview/product_type/:id' => 'website/site#product_type', as: 'preview_product_type'

end

Rails.application.routes.draw do

  resources :social_networks

  resources :ribbons

  get 'home_website_config' => 'home_website_configs#index', :as => 'home_website_config'
  get 'home_website_config/edit' => 'home_website_configs#edit', :as => 'edit_home_website_config'
  put 'home_website_config/edit' => 'home_website_configs#update'

  get 'general_information' => 'general_information#index', :as => 'general_information'
  get 'general_information/edit' => 'general_information#edit', :as => 'edit_general_information'
  put 'general_information/edit' => 'general_information#update'

  get 'contact_info' => 'contact_infos#index', :as => 'contact_info'
  get 'contact_info/edit' => 'contact_infos#edit', :as => 'edit_contact_info'
  put 'contact_info/edit' => 'contact_infos#update'
  post 'contact_info/edit' => 'contact_infos#update'

  resources :ourworks

  resources :opinions

  resources :member_teams

  get 'home/landing'

  root 'home#landing'

  resources :product_types do
    resources :product_categories
    resources :product_sub_types
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

  get '/preview/product_types' => 'website/site#product_type_index', as: 'preview_product_type_index'
  get '/preview/product_types/:product_type_id/products' => 'website/site#products_index', as: 'preview_products_index'
  get '/preview/product_types/:product_type_id/products/:id' => 'website/site#product_show', as: 'preview_product_show'
  get '/info/products/:id' => 'website/site#product_show', as: 'preview_product_info'
  get '/info/ourworks' => 'website/site#ourworks_index', as: 'preview_ourworks_index'

end

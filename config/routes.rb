Rails.application.routes.draw do

  resources :opinions
  resources :member_teams
  get 'home/landing'

  root 'home#landing'

  resources :product_types do
    resources :products
  end

end

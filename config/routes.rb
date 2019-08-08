Rails.application.routes.draw do
  resources :gossip
  resources :city
  resources :session
  #get 'city/:city_id', to: 'city#show', as: 'show_city'
  get '/', to: 'gossip#index'
  resources :user
  #get 'user/:user_id', to: 'user#show', as: 'show_user'
  get 'team', to: 'static#team'
  get 'contact', to: 'static#contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

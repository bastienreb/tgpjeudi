Rails.application.routes.draw do
  get '/', to: 'static#welcome', as: 'welcome'
  get 'team', to: 'static#team'
  get 'contact', to: 'static#contact'
  get 'gossip', to: 'static#gossip', as: 'gossip'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

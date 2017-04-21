Rails.application.routes.draw do
  resources :attributes
  match "/auth/:provider/callback", to: "sessions#create", via: [:get, :post]
  match "/auth/failure", to: "sessions#failure", via: [:get, :post]

  resources :characters
  resources :feats
  resources :games
  resources :identities
  resources :rule_sets
  resources :skills
  resources :sessions, on: [:new, :create, :destory]
end

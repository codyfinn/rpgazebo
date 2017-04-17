Rails.application.routes.draw do
  match "/auth/:provider/callback", to: "sessions#create", via: [:get, :post]
  match "/auth/failure", to: "sessions#failure", via: [:get, :post]

  resources :character_attributes
  resources :characters
  resources :feats
  resources :games
  resources :identities
  resources :rule_sets
  resources :skills
  resources :sessions, on: [:new, :create, :destory]
end

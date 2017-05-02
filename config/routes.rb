Rails.application.routes.draw do
  resources :items
  resources :spells
  resources :feats
  resources :base_attributes
  resources :characters, only: [:show, :index]
  resources :encounters, only: [:show, :index]
  resources :games do 
    resources :characters
    resources :encounters
  end
  match "/games/:game_id/encounters/new", to: "encounters#create", via: [:post]
  match "/games/:game_id/characters/new", to: "characters#create", via: [:post]
  resources :rule_sets
  resources :character_atrributes
  match "/auth/:provider/callback", to: "sessions#create", via: [:get, :post]
  match "/auth/failure", to: "sessions#failure", via: [:get, :post]
  match "/logout", to: "sessions#destory", via: [:get, :post], :as => :logout

  resources :identities
  resources :sessions, on: [:new, :create, :destory]
end

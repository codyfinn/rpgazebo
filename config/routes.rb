Rails.application.routes.draw do    
  
  resources :games
  resources :skills
  resources :feats
  resources :character_attributes
  resources :rule_sets
end

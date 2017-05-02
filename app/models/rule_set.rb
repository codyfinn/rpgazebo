class RuleSet < ApplicationRecord  
  belongs_to :user
  has_many :games
  has_many :base_attributes
  has_many :feats
  has_many :spells
  has_many :items
end

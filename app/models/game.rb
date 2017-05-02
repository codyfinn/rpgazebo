class Game < ApplicationRecord
  belongs_to :rule_set
  has_many :encounters
  has_many :characters  
end

class Character < ApplicationRecord
  has_one :rule_set
  belongs_to :game
end

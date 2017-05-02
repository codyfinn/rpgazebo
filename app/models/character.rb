class Character < ApplicationRecord
  belongs_to :game
  has_many :character_attributes
  accepts_nested_attributes_for :character_attributes
end

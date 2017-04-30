class Game < ApplicationRecord
  belongs_to :user
  has_many :characters
  has_many :encounters
end

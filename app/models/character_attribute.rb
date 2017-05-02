class CharacterAttribute < ApplicationRecord
  belongs_to :character
  belongs_to :base_attribute
end

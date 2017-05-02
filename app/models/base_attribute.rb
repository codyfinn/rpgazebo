class BaseAttribute < ApplicationRecord
  belongs_to :rule_set
  has_many :character_attributes
end

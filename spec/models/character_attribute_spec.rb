require 'rails_helper'

RSpec.describe CharacterAttribute, type: :model do
  describe "structure" do
    it { is.expected.to have_db_column(:ability_score) }
    it { is.expected.to have_db_column(:ability_modifier) }
  end
  
  describe "associations" do
    it { is.expected.to belong_to(:character) }
    it { is.expected.to belong_to(:base_attribute) }
  end
end

require 'rails_helper'

RSpec.describe Character, type: :model do
  describe "structure" do
    it { is_expected.to have_db_column(:name).with_options(null: false) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:game) }
    it { is_expected.to have_many(:character_attributes) }
    it { is_expected.to have_many(:spells) }
    
  end
end

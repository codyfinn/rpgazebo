require 'rails_helper'

RSpec.describe Encounter, type: :model do
  describe "structure" do
    it { is_expected.to have_db_column(:name).with_options(null: false) }
    it { is_expected.to have_db_column(:experience_points)}
    it { is_expected.to have_db_column(:description) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:game) }
  end
end

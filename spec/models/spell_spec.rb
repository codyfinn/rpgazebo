require 'rails_helper'

RSpec.describe Spell, type: :model do
  describe "structure" do
    it { is_expected.to have_db_column(:name).with_options(null: false) }
    it { is_expected.to have_db_column(:description) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:rule_set)}
  end
end

require 'rails_helper'

RSpec.describe User, type: :model do
  describe "structure" do
    it { is_expected.to have_db_column(:name).with_options(null: false) }
    it { is_expected.to have_db_column(:provider).with_options(null: false) }
    it { is_expected.to have_db_column(:uid).with_options(null: false) }
  end

  describe "associations" do
    it { is_expected.to have_many(:rule_sets) }
    it { is_expected.to have_many(:games) }
  end
end

require 'rails_helper'

RSpec.describe Correspondance, type: :model do
  before(:each) do
    @correspondance = FactoryBot.create(:correspondance)
  end

  describe 'database' do
    subject(:new_correspondance) { described_class.new }

    it { is_expected.to have_db_column(:id).of_type(:integer) }
    it { is_expected.to have_db_column(:user_one_id).of_type(:integer) }
    it { is_expected.to have_db_column(:user_two_id).of_type(:integer) }
  end


  describe 'Associations' do
    it { is_expected.to belong_to(:user_one) }
    it { is_expected.to belong_to(:user_two) }
  end

  context "validation" do
    it "is valid with valid attributes" do
      expect(@correspondance).to be_a(Correspondance)
    end
  end

end

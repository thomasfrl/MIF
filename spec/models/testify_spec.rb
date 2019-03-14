require 'rails_helper'

RSpec.describe Testify, type: :model do
  before(:each) do
    @testify = FactoryBot.create(:testify)
  end

  describe 'database' do
    subject(:new_testify) { described_class.new }

    it { is_expected.to have_db_column(:id).of_type(:integer) }
    it { is_expected.to have_db_column(:user_id).of_type(:integer) }
    it { is_expected.to have_db_column(:content).of_type(:text) }
    it { is_expected.to have_db_column(:accepted).of_type(:boolean) }
  end

  context "validation" do
    it "is valid with valide attributes" do
      expect(@testify).to be_a(Testify)
    end

    describe "attributes" do
      it {expect(@testify).to validate_presence_of(:content)}
    end

  end
end

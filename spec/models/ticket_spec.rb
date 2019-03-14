require 'rails_helper'

RSpec.describe Ticket, type: :model do
  before(:each) do
    @ticket = FactoryBot.create(:ticket)
  end

  describe 'database' do
    subject(:new_ticket) { described_class.new }

    it { is_expected.to have_db_column(:id).of_type(:integer) }
    it { is_expected.to have_db_column(:object).of_type(:string) }
    it { is_expected.to have_db_column(:category).of_type(:string) }
    it { is_expected.to have_db_column(:content).of_type(:text) }
    it { is_expected.to have_db_column(:user_id).of_type(:integer) }
    it { is_expected.to have_db_column(:status).of_type(:string) }
  end

  context "validation" do
    it "is valid with valide attributes" do
      expect(@ticket).to be_a(Ticket)
    end

    describe "attributes" do
      it {expect(@ticket).to validate_presence_of(:object)}
      it {expect(@ticket).to validate_presence_of(:category)}
      it {expect(@ticket).to validate_presence_of(:content)}
    end

  end
end

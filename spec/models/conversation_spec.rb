require 'rails_helper'

RSpec.describe Conversation, type: :model do
  before(:each) do
    @conversation = FactoryBot.create(:conversation)
  end

  describe 'database' do
    subject(:new_conversation) { described_class.new }

    it { is_expected.to have_db_column(:id).of_type(:integer) }
    it { is_expected.to have_db_column(:author_id).of_type(:integer) }
    it { is_expected.to have_db_column(:receiver_id).of_type(:integer) }
  end

  context "validation" do
    it "is valid with valide attributes" do
      expect(@conversation).to be_a(Conversation)
    end

    describe "#content" do
      it {expect(@conversation).to validate_presence_of(:content)}
    end

  end
end

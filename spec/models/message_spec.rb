require 'rails_helper'

RSpec.describe Message, type: :model do
  before(:each) do
    @message = FactoryBot.create(:message)
  end

  describe 'database' do
    subject(:new_message) { described_class.new }

    it { is_expected.to have_db_column(:id).of_type(:integer) }
    it { is_expected.to have_db_column(:user_id).of_type(:integer) }
    it { is_expected.to have_db_column(:conversation_id).of_type(:integer) }
    it { is_expected.to have_db_column(:read).of_type(:boolean) }
  end

  context "validation" do
    it "is valid with valide attributes" do
      expect(@message).to be_a(Message)
    end

  end
end

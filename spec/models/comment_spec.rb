require 'rails_helper'

RSpec.describe Comment, type: :model do

  before(:each) do
    @comment = FactoryBot.create(:comment)
  end

  describe 'database' do
    subject(:new_comment) { described_class.new }

    it { is_expected.to have_db_column(:id).of_type(:integer) }
    it { is_expected.to have_db_column(:author_id).of_type(:integer) }
    it { is_expected.to have_db_column(:receiver_id).of_type(:integer) }
    it { is_expected.to have_db_column(:content).of_type(:text)}

  end





  describe 'associations' do
    it { is_expected.to belong_to(:author) }
    it { is_expected.to belong_to(:receiver) }
  end

  context "validation" do
    it "is valid with valide attributes" do
      expect(@comment).to be_a(Comment)
    end

    describe "#content" do
      it {expect(@comment).to validate_presence_of(:content)}
    end

  end
end

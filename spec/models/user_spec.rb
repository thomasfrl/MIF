require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    @user = FactoryBot.create(:user)
  end

  describe 'database' do
    subject(:new_user) { described_class.new }

    it { is_expected.to have_db_column(:id).of_type(:integer) }
    it { is_expected.to have_db_column(:first_name).of_type(:string) }
    it { is_expected.to have_db_column(:last_name).of_type(:string) }
    it { is_expected.to have_db_column(:email).of_type(:string)}
    it { is_expected.to have_db_column(:description).of_type(:text)}
    it { is_expected.to have_db_column(:encrypted_password).of_type(:string)}
    it { is_expected.to have_db_column(:welcome_message).of_type(:text)}
    it { is_expected.to have_db_column(:age).of_type(:integer)}
  end

  context "validation" do
    it "is valid with valide attributes" do
      expect(@user).to be_a(User)
    end

    describe "#first_name" do
      it {expect(@user).to validate_presence_of(:first_name)}
    end

    describe "#password" do
      it {expect(@user).to validate_presence_of(:encrypted_password)}
      it { expect(@user).to allow_value("TestPassword").for(:password)}
      it { expect(@user).to allow_value("123456test").for(:password)}
      it { expect(@user).to allow_value("test123456").for(:password)}
      it { expect(@user).to_not allow_value("0000").for(:password)}
      it { expect(@user).to_not allow_value("test").for(:password)}
    end
  end

end

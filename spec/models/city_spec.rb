require 'rails_helper'

RSpec.describe City, type: :model do

  before(:each) do
    @city = FactoryBot.create(:city)
  end

  describe 'database' do
    subject(:new_ciy) { described_class.new }

    it { is_expected.to have_db_column(:id).of_type(:integer) }
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:country).of_type(:string) }
    it { is_expected.to have_db_column(:zip_code).of_type(:string)}
  end

  context "validation" do
    it "is valid with valide attributes" do
      expect(@city).to be_a(City)
    end

    describe "#name" do
      it {expect(@city).to validate_presence_of(:name)}
    end

    describe "#zip_code" do
      it {expect(@city).to validate_presence_of(:zip_code)}
      it { expect(@city).to allow_value("45216").for(:zip_code)}
      it { expect(@city).to allow_value("65203").for(:zip_code)}
      it { expect(@city).to allow_value("2a004").for(:zip_code)}
      it { expect(@city).to_not allow_value("000000").for(:zip_code)}
      it { expect(@city).to_not allow_value("test").for(:zip_code)}
    end
  end

end

require 'rails_helper'

RSpec.describe Flat, type: :model do
  before(:each) do
    @flat = FactoryBot.create(:flat)
  end


  describe 'Database' do
    subject(:new_flat) { described_class.new }

    it { is_expected.to have_db_column(:id).of_type(:integer) }
    it { is_expected.to have_db_column(:address).of_type(:string) }
    it { is_expected.to have_db_column(:description).of_type(:text) }
    it { is_expected.to have_db_column(:place).of_type(:integer) }
    it { is_expected.to have_db_column(:room).of_type(:string) }
    it { is_expected.to have_db_column(:sleep).of_type(:string) }

  end

  describe 'Associations' do
    it { is_expected.to belong_to(:user) }
  end

end

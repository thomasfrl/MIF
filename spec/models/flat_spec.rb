require 'rails_helper'

RSpec.describe Flat, type: :model do
  describe 'Database' do
    subject(:new_flat) { described_class.new }

    it { is_expected.to have_db_column(:id).of_type(:integer) }
    it { is_expected.to have_db_column(:address).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:description).of_type(:text).with_options(null: false) }
    it { is_expected.to have_db_column(:has_wifi).of_type(:boolean).with_options(null: false) }
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:user) }
  end

end

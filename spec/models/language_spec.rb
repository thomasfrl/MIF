require 'rails_helper'

RSpec.describe Language, type: :model do

  before(:each) do
    @language = FactoryBot.create(:language)
  end

  describe 'database' do
    subject(:new_language) { described_class.new }
    it { is_expected.to have_db_column(:id).of_type(:integer) }
    it { is_expected.to have_db_column(:language).of_type(:string) }
  end

end

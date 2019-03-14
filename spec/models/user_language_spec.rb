require 'rails_helper'

RSpec.describe UserLanguage, type: :model do

  describe 'Associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:language) }
  end
end

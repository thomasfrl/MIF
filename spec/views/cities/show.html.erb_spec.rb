require 'rails_helper'

RSpec.describe "cities/show", type: :view do
  before(:each) do
    @city = FactoryBot.create(:city)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Country/)
    expect(rendered).to match(/75000/)
  end
end

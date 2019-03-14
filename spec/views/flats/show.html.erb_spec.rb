require 'rails_helper'

RSpec.describe "flats/show", type: :view do
  before(:each) do
    @flat = FactoryBot.create(:flat)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
  end
end

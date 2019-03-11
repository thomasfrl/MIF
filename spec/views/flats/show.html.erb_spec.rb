require 'rails_helper'

RSpec.describe "flats/show", type: :view do
  before(:each) do
    @flat = assign(:flat, Flat.create!(
      :user => nil,
      :adress => "Adress",
      :description => "MyText",
      :has_wifi => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Adress/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
  end
end

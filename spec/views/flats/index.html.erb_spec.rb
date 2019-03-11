require 'rails_helper'

RSpec.describe "flats/index", type: :view do
  before(:each) do
    assign(:flats, [
      Flat.create!(
        :user => nil,
        :adress => "Adress",
        :description => "MyText",
        :has_wifi => false
      ),
      Flat.create!(
        :user => nil,
        :adress => "Adress",
        :description => "MyText",
        :has_wifi => false
      )
    ])
  end

  it "renders a list of flats" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Adress".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end

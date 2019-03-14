require 'rails_helper'

RSpec.describe "cities/index", type: :view do
  before(:each) do
    assign(:cities, [
      City.create!(
        :name => "Name",
        :country => "Country",
        :zip_code => "75001"
      ),
      City.create!(
        :name => "Name",
        :country => "Country",
        :zip_code => "75000"
      )
    ])
  end

  it "renders a list of cities" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "75000".to_s, :count => 1
  end
end

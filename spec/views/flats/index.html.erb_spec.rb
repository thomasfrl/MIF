require 'rails_helper'

RSpec.describe "flats/index", type: :view do
  before(:each) do
    assign(:flats, [
      FactoryBot.create(:flat),
      FactoryBot.create(:flat)
    ])
  end

  it "renders a list of flats" do
    render
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end

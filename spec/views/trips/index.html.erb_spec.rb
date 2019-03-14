require 'rails_helper'

RSpec.describe "trips/index", type: :view do
  before(:each) do
    assign(:trips, [
      Trip.create!(
        :correspondance => nil,
        :host => nil,
        :duration => 2
      ),
      Trip.create!(
        :correspondance => nil,
        :host => nil,
        :duration => 2
      )
    ])
  end

  it "renders a list of trips" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end

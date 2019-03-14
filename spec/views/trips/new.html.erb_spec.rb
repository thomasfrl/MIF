require 'rails_helper'

RSpec.describe "trips/new", type: :view do
  before(:each) do
    assign(:trip, Trip.new(
      :correspondance => nil,
      :host => nil,
      :duration => 1
    ))
  end

  it "renders new trip form" do
    render

    assert_select "form[action=?][method=?]", trips_path, "post" do

      assert_select "input[name=?]", "trip[correspondance_id]"

      assert_select "input[name=?]", "trip[host_id]"

      assert_select "input[name=?]", "trip[duration]"
    end
  end
end

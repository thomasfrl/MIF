require 'rails_helper'

RSpec.describe "trips/edit", type: :view do
  before(:each) do
    @trip = assign(:trip, Trip.create!(
      :correspondance => nil,
      :host => nil,
      :duration => 1
    ))
  end

  it "renders the edit trip form" do
    render

    assert_select "form[action=?][method=?]", trip_path(@trip), "post" do

      assert_select "input[name=?]", "trip[correspondance_id]"

      assert_select "input[name=?]", "trip[host_id]"

      assert_select "input[name=?]", "trip[duration]"
    end
  end
end

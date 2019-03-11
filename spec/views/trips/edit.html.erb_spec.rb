require 'rails_helper'

RSpec.describe "trips/edit", type: :view do
  before(:each) do
    @trip = assign(:trip, Trip.create!(
      :duration => 1,
      :correspondance => nil,
      :host => nil
    ))
  end

  it "renders the edit trip form" do
    render

    assert_select "form[action=?][method=?]", trip_path(@trip), "post" do

      assert_select "input[name=?]", "trip[duration]"

      assert_select "input[name=?]", "trip[correspondance_id]"

      assert_select "input[name=?]", "trip[host_id]"
    end
  end
end

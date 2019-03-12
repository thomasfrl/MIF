require 'rails_helper'

RSpec.describe "flats/new", type: :view do
  before(:each) do
    assign(:flat, Flat.new(
      :user => nil,
      :address => "MyString",
      :description => "MyText",
      :has_wifi => false
    ))
  end

  it "renders new flat form" do
    render

    assert_select "form[action=?][method=?]", flats_path, "post" do

      assert_select "input[name=?]", "flat[user_id]"

      assert_select "input[name=?]", "flat[address]"

      assert_select "textarea[name=?]", "flat[description]"

      assert_select "input[name=?]", "flat[has_wifi]"
    end
  end
end

require 'rails_helper'

RSpec.describe "flats/edit", type: :view do
  before(:each) do
    @flat = assign(:flat, Flat.create!(
      :user => nil,
      :address => "MyString",
      :description => "MyText",
      :has_wifi => false
    ))
  end

  it "renders the edit flat form" do
    render

    assert_select "form[action=?][method=?]", flat_path(@flat), "post" do

      assert_select "input[name=?]", "flat[user_id]"

      assert_select "input[name=?]", "flat[address]"

      assert_select "textarea[name=?]", "flat[description]"

      assert_select "input[name=?]", "flat[has_wifi]"
    end
  end
end

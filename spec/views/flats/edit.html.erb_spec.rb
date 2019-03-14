require 'rails_helper'

RSpec.describe "flats/edit", type: :view do
  before(:each) do
    @flat = FactoryBot.create(:flat)
  end

  it "renders the edit flat form" do
    render

    assert_select "form[action=?][method=?]", flat_path(@flat), "post" do


      assert_select "input[name=?]", "flat[address]"

      assert_select "textarea[name=?]", "flat[description]"

    end
  end
end

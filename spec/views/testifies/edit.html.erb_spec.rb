require 'rails_helper'

RSpec.describe "testifies/edit", type: :view do
  before(:each) do
    @testify = FactoryBot.create(:testify)
  end

  it "renders the edit testify form" do
    render

    assert_select "form[action=?][method=?]", testify_path(@testify), "post" do


      assert_select "textarea[name=?]", "testify[content]"

    end
  end
end

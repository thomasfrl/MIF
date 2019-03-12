require 'rails_helper'

RSpec.describe "testifies/edit", type: :view do
  before(:each) do
    @testify = assign(:testify, Testify.create!(
      :user => nil,
      :content => "MyText",
      :accepted => false
    ))
  end

  it "renders the edit testify form" do
    render

    assert_select "form[action=?][method=?]", testify_path(@testify), "post" do

      assert_select "input[name=?]", "testify[user_id]"

      assert_select "textarea[name=?]", "testify[content]"

      assert_select "input[name=?]", "testify[accepted]"
    end
  end
end

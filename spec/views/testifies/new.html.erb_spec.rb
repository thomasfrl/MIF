require 'rails_helper'

RSpec.describe "testifies/new", type: :view do
  before(:each) do
    assign(:testify, Testify.new(
      :user => nil,
      :content => "MyText",
      :accepted => false
    ))
  end

  it "renders new testify form" do
    render

    assert_select "form[action=?][method=?]", testifies_path, "post" do

      assert_select "input[name=?]", "testify[user_id]"

      assert_select "textarea[name=?]", "testify[content]"

      assert_select "input[name=?]", "testify[accepted]"
    end
  end
end

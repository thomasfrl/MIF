require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      :first_name => "MyString",
      :last_name => "MyString",
      :description => "MyText",
      :age => 1,
      :welcome_message => "MyText",
      :nationality => "MyString",
      :city => nil
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input[name=?]", "user[first_name]"

      assert_select "input[name=?]", "user[last_name]"

      assert_select "textarea[name=?]", "user[description]"

      assert_select "input[name=?]", "user[age]"

      assert_select "textarea[name=?]", "user[welcome_message]"

      assert_select "input[name=?]", "user[nationality]"

      assert_select "input[name=?]", "user[city_id]"
    end
  end
end

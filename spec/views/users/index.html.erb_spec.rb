require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :description => "MyText",
        :age => 2,
        :welcome_message => "MyText",
        :nationality => "Nationality",
        :city => nil
      ),
      User.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :description => "MyText",
        :age => 2,
        :welcome_message => "MyText",
        :nationality => "Nationality",
        :city => nil
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Nationality".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end

require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :first_name => "First Name",
      :last_name => "Last Name",
      :description => "MyText",
      :age => 2,
      :welcome_message => "MyText",
      :nationality => "Nationality",
      :city => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Nationality/)
    expect(rendered).to match(//)
  end
end

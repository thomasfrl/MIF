require 'rails_helper'

RSpec.describe "user_languages/index", type: :view do
  before(:each) do
    assign(:user_languages, [
      UserLanguage.create!(
        :user => nil,
        :language => nil
      ),
      UserLanguage.create!(
        :user => nil,
        :language => nil
      )
    ])
  end

  it "renders a list of user_languages" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end

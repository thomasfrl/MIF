require 'rails_helper'

RSpec.describe "user_languages/new", type: :view do
  before(:each) do
    assign(:user_language, UserLanguage.new(
      :user => nil,
      :language => nil
    ))
  end

  it "renders new user_language form" do
    render

    assert_select "form[action=?][method=?]", user_languages_path, "post" do

      assert_select "input[name=?]", "user_language[user_id]"

      assert_select "input[name=?]", "user_language[language_id]"
    end
  end
end

require 'rails_helper'

RSpec.describe "user_languages/edit", type: :view do
  before(:each) do
    @user_language = assign(:user_language, UserLanguage.create!(
      :user => nil,
      :language => nil
    ))
  end

  it "renders the edit user_language form" do
    render

    assert_select "form[action=?][method=?]", user_language_path(@user_language), "post" do

      assert_select "input[name=?]", "user_language[user_id]"

      assert_select "input[name=?]", "user_language[language_id]"
    end
  end
end

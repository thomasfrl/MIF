require 'rails_helper'

RSpec.describe "languages/new", type: :view do
  before(:each) do
    assign(:language, Language.new(
      :language => "MyString",
      :user => nil
    ))
  end

  it "renders new language form" do
    render

    assert_select "form[action=?][method=?]", languages_path, "post" do

      assert_select "input[name=?]", "language[language]"

      assert_select "input[name=?]", "language[user_id]"
    end
  end
end

require 'rails_helper'

RSpec.describe "comments/edit", type: :view do
  before(:each) do
    @comment = FactoryBot.create(:comment)
  end

  it "renders the edit comment form" do
    render

    assert_select "form[action=?][method=?]", comment_path(@comment), "post" do

      assert_select "input[name=?]", "comment[user_id]"

      assert_select "input[name=?]", "comment[user_id]"

      assert_select "textarea[name=?]", "comment[content]"
    end
  end
end

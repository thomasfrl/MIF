require 'rails_helper'

RSpec.describe "conversations/edit", type: :view do
  before(:each) do
    @conversation = assign(:conversation, Conversation.create!(
      :user_one => nil,
      :user_two => nil
    ))
  end

  it "renders the edit conversation form" do
    render

    assert_select "form[action=?][method=?]", conversation_path(@conversation), "post" do

      assert_select "input[name=?]", "conversation[user_one_id]"

      assert_select "input[name=?]", "conversation[user_two_id]"
    end
  end
end

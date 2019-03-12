require 'rails_helper'

RSpec.describe "conversations/index", type: :view do
  before(:each) do
    assign(:conversations, [
      Conversation.create!(
        :user_one => nil,
        :user_two => nil
      ),
      Conversation.create!(
        :user_one => nil,
        :user_two => nil
      )
    ])
  end

  it "renders a list of conversations" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end

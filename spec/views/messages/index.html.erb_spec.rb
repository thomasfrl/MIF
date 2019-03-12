require 'rails_helper'

RSpec.describe "messages/index", type: :view do
  before(:each) do
    assign(:messages, [
      Message.create!(
        :user => nil,
        :conversation => nil
      ),
      Message.create!(
        :user => nil,
        :conversation => nil
      )
    ])
  end

  it "renders a list of messages" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end

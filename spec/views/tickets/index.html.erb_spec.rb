require 'rails_helper'

RSpec.describe "tickets/index", type: :view do
  before(:each) do
    assign(:tickets, [
      Ticket.create!(
        :object => "Object",
        :category => "Category",
        :content => "MyText",
        :user => nil,
        :status => "Status"
      ),
      Ticket.create!(
        :object => "Object",
        :category => "Category",
        :content => "MyText",
        :user => nil,
        :status => "Status"
      )
    ])
  end

  it "renders a list of tickets" do
    render
    assert_select "tr>td", :text => "Object".to_s, :count => 2
    assert_select "tr>td", :text => "Category".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end

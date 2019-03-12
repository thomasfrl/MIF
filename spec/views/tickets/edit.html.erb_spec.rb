require 'rails_helper'

RSpec.describe "tickets/edit", type: :view do
  before(:each) do
    @ticket = assign(:ticket, Ticket.create!(
      :object => "MyString",
      :category => "MyString",
      :content => "MyText",
      :user => nil,
      :status => "MyString"
    ))
  end

  it "renders the edit ticket form" do
    render

    assert_select "form[action=?][method=?]", ticket_path(@ticket), "post" do

      assert_select "input[name=?]", "ticket[object]"

      assert_select "input[name=?]", "ticket[category]"

      assert_select "textarea[name=?]", "ticket[content]"

      assert_select "input[name=?]", "ticket[user_id]"

      assert_select "input[name=?]", "ticket[status]"
    end
  end
end

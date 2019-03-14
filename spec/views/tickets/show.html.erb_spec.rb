require 'rails_helper'

RSpec.describe "tickets/show", type: :view do
  before(:each) do
    @ticket = assign(:ticket, Ticket.create!(
      :object => "Object",
      :category => "Category",
      :content => "MyText",
      :user => nil,
      :status => "Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Object/)
    expect(rendered).to match(/Category/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Status/)
  end

end

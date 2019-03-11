require 'rails_helper'

RSpec.describe "correspondances/index", type: :view do
  before(:each) do
    assign(:correspondances, [
      Correspondance.create!(
        :user1 => nil,
        :user2 => nil
      ),
      Correspondance.create!(
        :user1 => nil,
        :user2 => nil
      )
    ])
  end

  it "renders a list of correspondances" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end

require 'rails_helper'

RSpec.describe "testifies/index", type: :view do
  before(:each) do
    assign(:testifies, [
      Testify.create!(
        :user => nil,
        :content => "MyText",
        :accepted => false
      ),
      Testify.create!(
        :user => nil,
        :content => "MyText",
        :accepted => false
      )
    ])
  end

  it "renders a list of testifies" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end

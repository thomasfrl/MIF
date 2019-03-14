require 'rails_helper'

RSpec.describe "testifies/index", type: :view do
  before(:each) do
    assign(:testifies, [
      FactoryBot.create(:testify),
      FactoryBot.create(:testify)
    ])
  end

  it "renders a list of testifies" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end

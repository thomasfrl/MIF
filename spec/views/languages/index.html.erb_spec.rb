require 'rails_helper'

RSpec.describe "languages/index", type: :view do
  before(:each) do
    assign(:languages, [
      FactoryBot.create(:language),
      FactoryBot.create(:language)
    ])
  end

  it "renders a list of languages" do
    render
    assert_select "tr>td", :text => "Language".to_s, :count => 2
  end
end

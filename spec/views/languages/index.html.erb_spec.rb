require 'rails_helper'

RSpec.describe "languages/index", type: :view do
  before(:each) do
    assign(:languages, [
      Language.create!(
        :language => "Language",
        :user => nil
      ),
      Language.create!(
        :language => "Language",
        :user => nil
      )
    ])
  end

  it "renders a list of languages" do
    render
    assert_select "tr>td", :text => "Language".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end

require 'rails_helper'

RSpec.describe "tickets/show", type: :view do
  before(:each) do
    @ticket = FactoryBot.create(:ticket)
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

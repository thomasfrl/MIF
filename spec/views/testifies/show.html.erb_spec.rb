require 'rails_helper'

RSpec.describe "testifies/show", type: :view do
  before(:each) do
    @testify = assign(:testify, Testify.create!(
      :user => nil,
      :content => "MyText",
      :accepted => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
  end
end

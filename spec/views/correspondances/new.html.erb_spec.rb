require 'rails_helper'

RSpec.describe "correspondances/new", type: :view do
  before(:each) do
    assign(:correspondance, Correspondance.new(
      :user => nil,
      :user => nil
    ))
  end

  it "renders new correspondance form" do
    render

    assert_select "form[action=?][method=?]", correspondances_path, "post" do

      assert_select "input[name=?]", "correspondance[user_id]"

      assert_select "input[name=?]", "correspondance[user_id]"
    end
  end
end

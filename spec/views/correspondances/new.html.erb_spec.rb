require 'rails_helper'

RSpec.describe "correspondances/new", type: :view do
  before(:each) do
    assign(:correspondance, Correspondance.new(
      :user1 => nil,
      :user2 => nil
    ))
  end

  it "renders new correspondance form" do
    render

    assert_select "form[action=?][method=?]", correspondances_path, "post" do

      assert_select "input[name=?]", "correspondance[user1_id]"

      assert_select "input[name=?]", "correspondance[user2_id]"
    end
  end
end

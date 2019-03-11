require 'rails_helper'

RSpec.describe "correspondances/edit", type: :view do
  before(:each) do
    @correspondance = assign(:correspondance, Correspondance.create!(
      :user1 => nil,
      :user2 => nil
    ))
  end

  it "renders the edit correspondance form" do
    render

    assert_select "form[action=?][method=?]", correspondance_path(@correspondance), "post" do

      assert_select "input[name=?]", "correspondance[user1_id]"

      assert_select "input[name=?]", "correspondance[user2_id]"
    end
  end
end

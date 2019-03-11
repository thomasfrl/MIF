require 'rails_helper'

RSpec.describe "Testifies", type: :request do
  describe "GET /testifies" do
    it "works! (now write some real specs)" do
      get testifies_path
      expect(response).to have_http_status(200)
    end
  end
end

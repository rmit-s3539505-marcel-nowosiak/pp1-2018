require 'rails_helper'

RSpec.describe "Employments", type: :request do
  describe "GET /employments" do
    it "works! (now write some real specs)" do
      get employments_path
      expect(response).to have_http_status(200)
    end
  end
end

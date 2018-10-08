require 'rails_helper'

RSpec.describe EmployerProfile, type: :model do
  fixtures :employer_profiles, :listings, :users
  context "with 2 or more listings" do
    it "should be able to retrieve all of them" do
      e = employer_profiles(:e1)
      e.listings << [listings(:l1), listings(:l2)]
      expect(e.listings.count).to eq 2
    end
  end

  context "attached to a user" do
    it "should be able to retrieve the user" do
      e = employer_profiles(:e1)
      e.user = users(:u1)
      expect(e.user).to eq users(:u1)
    end
  end
end

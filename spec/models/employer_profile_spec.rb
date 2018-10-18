require 'rails_helper'

RSpec.describe EmployerProfile, type: :model do
  fixtures :employer_profiles, :listings, :users
  context "newly created" do
    it "should have no listings to begin with" do
      expect(EmployerProfile.new.listings.count).to eq 0
    end

    it "should not be attached to a user" do
      expect(EmployerProfile.new.user).to eq nil
    end
  end

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

    it "should be able to retrieve user's name" do
      e = employer_profiles(:e1)
      e.user = users(:u1)
      exect(e.user.name).to eq users(:u1).first_name
    end
  end
end

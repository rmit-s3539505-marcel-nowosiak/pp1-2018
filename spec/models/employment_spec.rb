require 'rails_helper'

RSpec.describe Employment, type: :model do
  fixtures :listings, :hunter_profiles
  context "newly created" do
    it "should not have a listing" do
      expect(Employment.new.listing).to eq nil
    end

    it "should not have an hunter" do
      expect(Employment.new.hunter_profile).to eq nil
    end
  end

  context "hunter has been offered a listing" do
    it "should be able to retrieve an hunter_profile" do
      h, l = hunter_profiles(:h1), listings(:l1)
      e = Employment.new
      e.hunter_profile, e.listing = h, l
      expect(e.hunter_profile).to eq h
    end

    it "should be able to retrieve a listing" do
      h, l = hunter_profiles(:h1), listings(:l1)
      e = Employment.new
      e.hunter_profile, e.listing = h, l
      expect(e.listing).to eq l
    end
  end
end

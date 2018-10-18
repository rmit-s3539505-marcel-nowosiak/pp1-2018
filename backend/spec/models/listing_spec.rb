require 'rails_helper'

RSpec.describe Listing, type: :model do
  fixtures :listings, :hunter_profiles, :employer_profiles
  context "newly created" do
    it "should have no employer profile attached" do

    end
  end

  context "attached to an employer profile" do
    it "should be able to access the employer" do
      l = listings(:l1)
      
    end
  end
end

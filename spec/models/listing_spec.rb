require 'rails_helper'

RSpec.describe Listing, type: :model do
  fixtures :listings, :hunter_profiles, :employer_profiles
  context "newly created" do
    it "should have no employer profile attached" do

    end
  end
end

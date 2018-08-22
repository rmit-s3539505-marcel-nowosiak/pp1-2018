require 'rails_helper'

RSpec.describe Skill, type: :model do
  context "name" do
    it "should be non-empty" do
      s = Skill.new(:name => "")
      expect(s).to_not be_valid
    end

    it "should not be nil" do
      s = Skill.new(:name => nil)
    end
  end
end

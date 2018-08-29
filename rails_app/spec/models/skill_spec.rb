require 'rails_helper'

RSpec.describe Skill, type: :model do
  context "with an name empty name" do
    it "should be invalid" do
      s = Skill.new(:name => "")
      expect(s).to_not be_valid
    end
  end

  context "with a nil name" do
    it "should not be valid" do
      s = Skill.new(:name => nil)
      expect(s).to_not be_valid
    end
  end

  context "with a name that has atleast 3 chars" do
    it "should be valid" do
      s = Skill.new(:name => 'Ski')
      expect(s).to be_valid
    end
  end

  context "with a name that has less than 3 chars" do
    it "should not be valid" do
      s = Skill.new(:name => 'ab')
      expect(s).to_not be_valid
    end
  end
end

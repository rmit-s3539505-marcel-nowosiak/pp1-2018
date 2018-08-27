class HunterProfilesController < ApplicationController
  def new
    @hunter_profile = HunterProfile.new
    10.times do
      skill = @hunter_profile.skill.build
  end
end

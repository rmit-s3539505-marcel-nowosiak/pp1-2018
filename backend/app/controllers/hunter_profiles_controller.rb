class HunterProfilesController < ApplicationController

  def index
    @hunter_profile = HunterProfile.find(params[:id])
  end

  def show
    @hunter_profile = HunterProfile.find(params[:id])
    @user = @hunter_profile.user
  end

  def new
    @hunter_profile = HunterProfile.new
    @skills = Skill.all.map{|u| { id: u.id, name: u.name, industry: u.industry}}
  end

  def create
  end

  def edit
    @hunter_profile = HunterProfile.find(params[:id])
  end

  def update
  end

  def destroy
    @hunter_profile = hunter_profile.find(params[:id])
    @hunter_profile.destroy
    flash[:notice] = "Successfully destroyed job hunter profile."
    redirect_to hunter_profiles_url
  end
end

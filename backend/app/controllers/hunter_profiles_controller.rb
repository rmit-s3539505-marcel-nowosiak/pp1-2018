class HunterProfilesController < ApplicationController
  before_action :get_user, only: [:create, :edit, :update, :destroy]
  before_action :get_profile, only: [:edit, :update, :destroy]
  before_action :get_skills, only: [:new, :edit, :update]

  def index
  end

  def show
  end

  def new
    #@user.hunter_profile = HunterProfile.new
    @hunter_profile = HunterProfile.new
  end

  def create
    @hunter_profile = HunterProfile.new(profile_params)
    #@hunter_profile.user_id = current_user.id
    if @hunter_profile.save
      @user.hunter_profile = @hunter_profile
      flash[:notice] = ["Your profile was successfully created"]
    else
      flash[:notice] = ["Your profile could not be created"]
    end
    redirect_to root_url
  end

  def edit
  end

  def update
    if @hunter_profile.update(profile_params)
      flash[:notice] = ["Your profile was successfully updated"]
      render 'show'
    else
      flash[:notice] = ["Your profile could not be updated"]
      redirect_to root_url
    end
  end

  def destroy
    @hunter_profile.destroy
    flash[:notice] = "Successfully destroyed job hunter profile."
    redirect_to hunter_profiles_url
  end

  private

    def get_skills
      @skills = Skill.all.map{|u| { id: u.id, name: u.name, industry: u.industry}}
    end

    def get_profile
      @hunter_profile = @user.hunter_profile
    end

    def get_user
      @user = current_user
      #@user = User.find(params[:id])
    end

    def profile_params
      params.permit(:industry, :hours, :location, :min_salary, :max_salary, :skill1, :skill2, :skill3, :skill4, :skill5)
    end
end

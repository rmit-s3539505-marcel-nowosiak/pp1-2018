class HunterProfilesController < ApplicationController
  before_action :get_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :get_profile, only: [:edit, :update, :destroy]
  before_action :get_skills, only: [:new, :edit, :update]

  def index
  end

  def show
  end

  def new
    if @user.hunter_profile.present?
      puts "profile exist"
      redirect_to edit_hunter_profile_path(@user.id)
    else
      @hunter_profile = HunterProfile.new
      puts "no profie, creating"
    end
  end

  def create
    @hunter_profile = HunterProfile.new(profile_params)
    puts @hunter_profile.inspect
    @hunter_profile.user_id = current_user.id
    if @hunter_profile.save
      @user.hunter_profile = @hunter_profile
      flash[:notice] = ["Your profile was successfully created"]
      puts "Your profile was successfully created"
      redirect_to edit_hunter_profile_path(@user.id)
    else
      flash[:notice] = ["Your profile could not be created"]
      puts "Your profile was not created"
      redirect_to root_path
    end
  end

  def edit
    if @user.hunter_profile.present?
      puts "profile exist"
    else
      puts "profile doesnt exist"
      redirect_to new_hunter_profile_path
    end
  end

  def update
    if @hunter_profile.update(profile_params)
      puts "Your profile was successfully updated"
      flash[:notice] = ["Your profile was successfully updated"]
    else
      flash[:notice] = ["Your profile could not be updated"]
    end
  end

  def offer
    hunter_profile.listings << listing
  end

  def destroy
    @user.hunter_profile.destroy
    flash[:notice] = "Successfully destroyed job hunter profile."
    redirect_to edit_hunter_profile_path(@user.id)
    puts "Your profile was successfully deleted"
  end

  private

    def get_skills
      #@skills = Skill.all.map{|s| [s.name, s.id, {:'skill_ind' => s.industry}]}
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
      params[:hunter_profile].permit(:industry, :hours, :location, :min_salary, :max_salary, :skill1, :skill2, :skill3, :skill4, :skill5)
    end
end

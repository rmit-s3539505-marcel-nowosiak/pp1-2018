class HunterProfilesController < ApplicationController
  before_action :get_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :get_profile, only: [:edit, :update, :destroy]
  before_action :get_skills, only: [:new, :edit, :update]
  before_action :check_profile, only: [:edit, :new]

  def index
  end

  def show
  end

  def new
    if @user.hunter_profile.present?
      flash[:notice] = "You already have a job hunter profile"
      redirect_to edit_hunter_profile_path(@user.id)
    else
      @hunter_profile = HunterProfile.new
    end
  end

  def create
    @hunter_profile = HunterProfile.new(profile_params)
    @hunter_profile.user_id = current_user.id
    if @hunter_profile.save
      params[:hunter_profile][:skill].each do |skill|
        if skill[:skill_id].present?
          @hunter_profile.skills << Skill.find(skill[:skill_id].to_i)
        end
      end
      @user.hunter_profile = @hunter_profile
      flash[:notice] = "Your profile was successfully created"
      redirect_to edit_hunter_profile_path(@user.id)
    else
      flash[:notice] = "Your profile could not be created"
      redirect_to root_path
    end
  end

  def edit
    if !@user.hunter_profile.present?
      flash[:notice] = "You have no profile, please create one"
      redirect_to new_hunter_profile_path
    end
  end

  def update
    if @hunter_profile.update(profile_params)
      flash[:notice] = "Your profile was successfully updated"
    else
      flash[:notice] = "Your profile could not be updated"
    end
  end

  def offer
    @hunter_profile = HunterProfile.find(params[:id])
    listing = params[:listing]
    @hunter_profile.listings << listing unless @hunter_profile.nil? or listing.nil?
    #render :nothing => true # render nothing
  end

  def destroy
    @user.hunter_profile.destroy
    flash[:notice] = "Successfully destroyed job hunter profile."
    redirect_to edit_hunter_profile_path(@user.id)
  end

  private

    def check_profile
      if @user.employer_profile.present?
        flash[:notice] = "You already have an employer profile"
        redirect_to root_url
      end
    end

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
      params[:hunter_profile].permit(:industry, :hours, :location, :min_salary, :max_salary)
    end
end

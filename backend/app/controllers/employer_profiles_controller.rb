class EmployerProfilesController < ApplicationController
  before_action :get_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :get_profile, only: [:edit, :update, :destroy]
  before_action :check_profile, only: [:edit, :new]

  def index
  end

  def show
  end

  def new
    if @user.employer_profile.present?
      flash[:notice] = "You already have an employer profile"
      redirect_to edit_employer_profile_path(@user.id)
    else
      @employer_profile = EmployerProfile.new
    end
  end

  def create
    @employer_profile = EmployerProfile.new(profile_params)
    @employer_profile.user_id = current_user.id
    if @employer_profile.save
      @user.employer_profile = @employer_profile
      flash[:notice] = "Your profile was successfully created"
      redirect_to edit_employer_profile_path(@user.id)
    else
      flash[:notice] = "Your profile could not be created"
      redirect_to root_path
    end
  end

  def edit
    if !@user.employer_profile.present?
      flash[:notice] = "You have no profile, please create one"
      redirect_to new_employer_profile_path
    end
  end

  def update
    if @employer_profile.update(profile_params)
      flash[:notice] = "Your profile was successfully updated"
    else
      flash[:notice] = "Your profile could not be updated"
    end
  end

  def destroy
    @user.employer_profile.destroy
    flash[:notice] = "Successfully destroyed employer profile."
    redirect_to edit_employer_profile_path(@user.id)
  end

  private

    def check_profile
      if @user.employer_profile.present?
        flash[:notice] = "You already have a job hunter profile"
        redirect_to root_url
      end
    end

    def get_profile
      @employer_profile = @user.employer_profile
    end

    def get_user
      @user = current_user
    end

    def profile_params
      params[:employer_profile].permit(:location, :business_name)
    end
end

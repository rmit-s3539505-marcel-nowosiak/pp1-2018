class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :require_login

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:sign_up) {u.permit(:first_name, :last_name, :email, :password, :password_confirmation)}
  # end

  # before_action :require_login

  before_action :configure_permitted_parameters, if: :devise_controller?


  # define app wide helper methods to more easily render the dashboards
  def find_user(id)
    User.find(id)
  end

  def find_hunter_profile(user_id)
    HunterProfile.find_by(:user_id => user_id)
  end

  def find_emp_profile(user_id)
    EmployerProfile.find_by(:user_id => user_id)
  end

  def find_hunter_matches(prof_id)
    # will contain all the matches for a profile
    @matches = Match.all.where(:hunterprofile_id => prof_id)
    @listings = []
    @matches.each do |m|
      @listings.push(Listing.find_by(:id => m.listing_id))
    end
    @listings
  end

  private
    def logged_in?
      true unless current_user == nil
    end

    def require_login
      unless logged_in?
        flash[:error] = "You must be logged in to access this section"
        redirect_to new_user_session_url # halts request cycle
      end
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password, :password_confirmation])
    end
end

class ApplicationController < ActionController::Base
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

  # this simply returns all the listings that are matched
  def all_matches
    Listing.joins(:hunter_profiles)
  end

  def find_matches(user_id)
    # just query based on the hunter_profile.id
    Listing.joins(:hunter_profiles)#.where()
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
end

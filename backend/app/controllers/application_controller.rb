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

  # to be used to render a list of matches to a particular job hunter on login
  def find_hunter_matches(prof_id)
    # find the hunterprofile to match from
    @hunter = HunterProfile.find(prof_id)
    return nil if @hunter.nil?

    @matches = Hash.new

    # Return a hash of listings, with scores
    @listings = Listing.where("
        min_salary >= ? AND
        hours == ?
      ",
      # listings with a salary that satisfies the hunter
      @hunter.min_salary,
      # match job hunters who have preferred hours
      @hunter.hours
    )
    @listings.each do |l|
      # generate and store the score of the match out of 100 to render in the view
      # as listings are only those which have matching hours and salary,
      # we aren't concerned with listings not in this set
      score = 0
      @matches[l] = score
    end
    return @matches
  end

  # to be used to render a list of matches to a particular listing on login
  def find_listing_matches(listing_id)
    # Find the listing that has the particular ID
    @listing = Listing.find(listing_id)
    # find users whose preference for salary is less than the one offered
    HunterProfile.where("min_salary < ?", @listing.min_salary)
  end

  # return a float of the KM distance between loc1 and loc2, useful for match
  # making based on distance. Should use google maps api
  def distance(loc1, loc2)
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

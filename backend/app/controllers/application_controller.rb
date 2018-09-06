class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :require_login

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:sign_up) {u.permit(:first_name, :last_name, :email, :password, :password_confirmation)}
  # end

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
    @listings = Listing.where("min_salary >= ?",
      # listings with a salary that satisfies the hunter
      @hunter.min_salary
    )

    @listings.each do |listing|
      # generate and store the score of the match out of 100 to render in the view
      # as listings are only those which have matching hours and salary,
      # we aren't concerned with listings not in this set

      # only store listings with a 50% or more match
      percentage = percentage(score(@hunter, listing), max_score(listing))
      if percentage > 50
        @matches[listing] = percentage.round
      end
    end
    # return all the valid listings with their score
    @matches
  end

  # to be used to render a list of matches to a particular listing on login
  def find_listing_matches(listing_id)
    # create an empty hashmap to render matches with scores
    @matches = Hash.new

    # Find the listing that has the particular ID
    @listing = Listing.find(listing_id)

    # find hunters whose preference for salary is less than/equal the one offered
    @hunters = HunterProfile.where("
      min_salary <= ?
      ",
      @listing.min_salary
    )
    @hunter.each do |hunter|
      # generate and store the score of the match out of 100 to render in the view
      # as listings are only those which have matching hours and salary,
      # we aren't concerned with listings not in this set

      # only store listings with a 50% or more match
      percentage = percentage(score(hunter, @listing), max_score(@listing))
      if percentage > 50
        # store the hunter with their match and return it to the view
        @matches[hunter] = percentage.round
      end
    end
    # return all the valid hunters for the listing that was queried
    @matches
  end

  # return a float of the metres distance between loc1 and loc2, useful for match
  # making based on distance. Should use google maps api
  def distance(loc1, loc2)
    return 1 # TODO implement method
  end

  # return a score from a hunter profile and listing
  def score(hunter, listing)
    score = 0
    # increment the score if there are matching hours
    score += 25 if hunter.hours == listing.hours
    # increment score if the locations are close
    # TODO implement properly. Ie, if less than 1km, add 25,
    #   if 1km < dist < 2km, add 20, etc
    score += 25 if distance(hunter.location, listing.location) < 1000
  end

  # return the max_score available
  def max_score(listing)
    15 * listing.get_required_skills.count + # 15 for each skill
    25 +  # hours
    25    # location; Smaller the distance, higher the score
  end

  # return the percentage of the match
  def percentage(score, max_score)
    100 * (score.to_f / max_score.to_f)
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

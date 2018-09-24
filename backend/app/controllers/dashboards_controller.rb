class DashboardsController < ApplicationController
  before_action :require_login
  # GET /dashboards
  def index
    # return all the listings if the user has a profile already
    if current_user.has_profile?
      @listings = get_listings
    end
  end

  def get_listings

    @user = User.find(current_user.id)
    if @user.is_employer?
      @matches = Hash.new
      # find all the matched hunters for each listing for an employer_profile
      # and return a hash of hunters for each listing
      @user.employer_profile.listings.each do |listing|
        # get all of the matches for a listing
        matchedHunters = find_listing_matches(listing.id)
        # store an array of the hunters
        @matches.store(listing, matchedHunters)
      end
    else
      @matches = []
      # otherwise find all of the matches for a hunter_profile from the join
      # table between listings and hunters
      @user.hunter_profile.listings.each do |listing|
        @matches.append(listing)
      end
    end
    @matches
  end
end

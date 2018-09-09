class DashboardsController < ApplicationController
  before_action :require_login
  # GET /dashboards
  def index
    @listings = Hash.new
    @user = User.find(current_user.id)
    if @user.is_employer?
      # find all the matched hunters for each listing for an employer_profile
      # and return a hash of hunters for each listing
      @user.employer_profile.listings.each do |listing|
        # get all of the matches for a listing
        @matchedHunters = find_listing_matches(listing.id)
        @matchedHunters.each do |h|
          # add each of the hunters for a listing to the hash to be rendered
          @listings[listing] = h
        end
      end
    else
      # otherwise find all of the matches for a hunter_profile
      
    end
    @listings
  end
end

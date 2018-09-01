class ListingsMatchesJob < ApplicationJob
  queue_as :urgent
  self.queue_adapter = :resque

  def perform(listing)
    # Find the user matches and store them in the database based on our matching
    # algorithm
    @listing = listing if listing.is_a? Listing
    return if @listing.nil?
    # otherwise we need to find all matching user's and then for each user,
    # add a new entry in Match
    @hunters = match_make(@listing.id)
    @hunters.each do |h|
      # store a new entry for every matching profile and listing
      Match.new(:hunterprofile_id => h.id, :listing_id => @listing.id)
    end
  end
end

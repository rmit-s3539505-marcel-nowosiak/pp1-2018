class ListingsMatchesJob < ApplicationJob
  queue_as :urgent
  self.queue_adapter = :resque

  def perform(listing)
    # Find the matches and store them in the database based on our matching
    # Algorithm
    @listing = listing if listing.is_a? Listing

  end
end

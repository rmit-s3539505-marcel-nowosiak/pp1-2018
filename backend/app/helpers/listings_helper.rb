module ListingsHelper
  def fetch_listings_for_hunter(h_id)
    listings = REDIS.get("listings")
    if listings.nil?
      listings = find_hunter_matches(h_id)
      REDIS.set("listings", listings)
    end
    @listings = JSON.load listings
  end
end

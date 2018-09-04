module ListingsHelper

  # cache all of the listings (faster to query redis than sql DB)
  def fetch_listings
    listings = REDIS.get("listings")
    # store listings in REDIS if they aren't there already
    if listings.nil?
      listings = Listing.all.to_json
      REDIS.set("listings", listings)
      REDIS.expire("listings", 3.hour.to_i)
    end
    # return a JSON hash of all the listings in the cache
    @listings_cache = JSON.load listings
  end
end

json.extract! listing, :id, :title, :body, :created_at, :updated_at
json.url post_url(listing, format: :json)

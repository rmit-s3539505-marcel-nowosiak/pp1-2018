source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.1'
# Use Puma as the app server
gem 'puma', '~> 3.11'

gem 'geocoder' # query apis for loation and searching data
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run sidekiq in production
# gem 'redis'
# gem 'redis-rails'
# gem 'redis-rack-cache'
# use sidekiq for queues
# gem 'sidekiq'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'devise'
gem 'cancancan'
gem 'rolify'

gem 'jquery-rails', '~> 4.3', '>= 4.3.3'
gem 'jquery-ui-rails'
gem 'jquery-turbolinks'
gem 'turbolinks'
gem 'bootstrap', '~> 4.1', '>= 4.1.3'
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'
gem 'mini_racer', platforms: :ruby

group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # use rspec instead of the default, test-unit
  gem 'rspec-rails'
  # factory girl is deprecated, upgrade to factory_bot
  gem 'factory_bot'
  # user faker with factory bot
  gem 'faker'
end

group :production do
  # use the postgres db in prod
  gem 'pg'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

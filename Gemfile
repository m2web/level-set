source 'https://rubygems.org'

gem 'rails', '3.2.0.rc2'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

#the sqlite3 gem will need to be enabled for:
#rake assets:precompile --trace RAILS_ENV=production
#will also need to update the setting:
#config.assets.compile = true in the config/environments/production.rb file
#gem 'sqlite3'

#these get rid of the execjs error upon server startup
gem 'execjs'
gem 'therubyracer'
gem 'bcrypt-ruby', :require => 'bcrypt'
gem 'gravatar_image_tag'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.0'

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :development do
	#gem 'sqlite3'
	gem "pg"
	gem 'rspec-rails'
	gem 'annotate', :git => 'git://github.com/ctran/annotate_models.git'
end

group :test do
  # Pretty printed test output
  #gem 'turn', '0.8.2', :require => false
	#gem 'sqlite3'
	gem "pg"
	gem 'rspec'
	gem 'webrat'
	gem "factory_girl_rails", "~> 1.6.0"
end

group :production do
  # gems specifically for Heroku go here
  gem "pg"
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'


rails_new () {
  _setup_git
  _setup_gems
  _setup_rspec
  _setup_user_table
}

_rails_g () {
  rails g $@
  git add .
  git commit -m "rails g $@"
}

_setup_rspec () {
  _rails_g "rspec:install"
}

_setup_user_table () {
  _rails_g "devise:install"
  _rails_g "devise User"
  _rails_g "devise:views"
}

_setup_gems () {
  cat <<Gemfile >Gemfile
source 'http://rubygems.org'

gem 'rails', '3.1.0'

gem 'sqlite3'

# Javascript
gem 'zurb-foundation'
gem 'jquery-rails'

# Rails stuff
gem 'hashrocket-rails'
gem 'devise'
gem 'fabrication'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

group :development, :test do
  gem 'ruby-debug19', :require => 'ruby-debug'
  gem 'rspec-rails'
end

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end
Gemfile
  bundle
}


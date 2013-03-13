source 'https://rubygems.org'

gem 'rails', '3.2.12'
gem 'mongoid'
gem 'haml'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

#gem 'sqlite3'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :development do
  gem 'haml-rails'
  # One day you won't have to download this manually
  # Download http://rubyforge.org/frs/download.php/75414/linecache19-0.5.13.gem
  # and run gem install ~/Downloads/linecach19-0.5.13.gem
  # Source: http://rubyforge.org/frs/?group_id=8883&release_id=46302
  gem 'ruby-debug-base19x',   '0.11.30.pre10'
  gem 'ruby-debug-ide',       '0.4.17.beta14'
  gem 'linecache19',          '0.5.13'
  gem 'pry'
end

group :test do
  gem 'database_cleaner'
  gem 'rb-fsevent',   '~> 0.9.1'
  gem 'spork',        '>= 1.0rc0' # spec server for running tests (speeds up load time between specs)
  gem 'fuubar'              # Adds progress bar to rspec
  gem 'factory_girl_rails'  # Used for fixtures, provides integration between factory_girl and rails
  gem 'spork-rails'
  gem 'guard-spork'
  gem 'guard-rspec'
  gem 'rspec-rails'         # Rspec Testing for rails
  gem 'mongoid-rspec'
end

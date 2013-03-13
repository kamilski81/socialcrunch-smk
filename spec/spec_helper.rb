require 'rubygems'
require 'spork'

Spork.prefork do

  require 'rails/application'
  require 'rails/mongoid'

  Spork.trap_class_method(Rails::Mongoid, :load_models)

  # Prevent main application to eager_load in the prefork block (do not load files in autoload_paths)
  Spork.trap_method(Rails::Application, :eager_load!)

  # Loading more in this block will cause your tests to run faster. However,
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.
  # This file is copied to spec/ when you run 'rails generate rspec:install'
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/autorun'
  require 'rspec/rails'

  # Load all railties files
  Rails.application.railties.all { |r| r.eager_load! }

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

  RSpec.configure do |config|
    config.fail_fast = true

    config.include Mongoid::Matchers

    # if repeating "FactoryGirl" is too verbose, ie. create(:user) instead of create(:user)
    config.include FactoryGirl::Syntax::Methods

    # ## Mock Framework
    #
    # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
    #
    # config.mock_with :mocha
    # config.mock_with :flexmock
    # config.mock_with :rr
    config.mock_with :rspec

    # If true, the base class of anonymous controllers will be inferred
    # automatically. This will be the default behavior in future versions of
    # rspec-rails.
    config.treat_symbols_as_metadata_keys_with_true_values = true
    config.infer_base_class_for_anonymous_controllers = false
    config.run_all_when_everything_filtered           = true
    config.filter_run focus: true

    # Run specs in random order to surface order dependencies. If you find an
    # order dependency and want to debug it, you can fix the order by providing
    # the seed, which is printed after each run.
    #     --seed 1234
    config.order = "random"

    require 'database_cleaner'
    puts 'anyways******'
    config.before(:suite) do
      puts 'kamil*****'
      DatabaseCleaner.strategy  = :truncation
      DatabaseCleaner.orm       = 'mongoid'
    end

    config.before(:each) do
      puts 'chmiel*****'
      DatabaseCleaner.clean
    end
    config.after(:each) do
      puts 'blah******'
    end
  end
end

Spork.each_run do
  # This code will be run each time you run your specs.
  # Fabrication.clear_definitions
end
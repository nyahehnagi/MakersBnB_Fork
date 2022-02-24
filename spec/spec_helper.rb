# frozen_string_literal: true

ENV['RACK_ENV'] = 'test'

require 'simplecov'
require 'simplecov-console'
require 'rspec'
require 'capybara'
require 'capybara/rspec'
require 'rake'
require_relative '../app'

require_relative './features/web_helpers'

Capybara.app = Mahah

# Load the Rakefile
Rake.application.load_rakefile

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
                                                                 SimpleCov::Formatter::Console
                                                               ])
SimpleCov.start

require File.join(File.dirname(__FILE__), '..', 'app.rb')

RSpec.configure do |config|
  config.before(:each) do
    Rake::Task['test_database_setup'].execute
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  # config.shared_context_metadata_behavior = :apply_to_host_groups

  # config.warnings = true

  # config.default_formatter = 'doc' if config.files_to_run.one?

  # config.profile_examples = 10
end

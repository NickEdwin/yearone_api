require 'simplecov'
require 'vcr'
SimpleCov.start 'rails'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.hook_into :faraday
  config.filter_sensitive_data('DONT_SHARE_MY_MOVIE_DATA_BASE_API_KEY') { ENV['MOVIE_DATA_BASE_API_KEY'] }
  config.configure_rspec_metadata!
end
end

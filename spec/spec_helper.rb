require 'rspec-benchmark'

RSpec.configure do |config|

  config.expect_with :rspec do |expectations|
    expectations.warn_about_potential_false_positives = false
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.include RSpec::Benchmark::Matchers
end

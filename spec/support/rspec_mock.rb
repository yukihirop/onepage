RSpec.configure do |config|
  #stubの返り値はnilを許さない
  config.mock_with :rspec do |mocks|
    mocks.allow_message_expectations_on_nil = true
  end
end

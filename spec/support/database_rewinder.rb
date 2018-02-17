RSpec.configure do |config|
  config.before(:suite) do
    DatabaseRewinder.strategy = :trancation
  end

  config.before(:each) do
    DatabaseRewinder.start
  end

  config.before(:each) do
    DatabaseRewinder.clean multiple:false
  end

  config.before(:all) do
    FactoryBot.reload
  end
end

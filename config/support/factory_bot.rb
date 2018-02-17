module Onepage
  class Application < Rails::Application
    config.generators do |g|
      g.fixture_replacement :factory_bot, dir: "spec/factories"
    end
  end
end

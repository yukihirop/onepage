module Onepage
  class Application < Rails::Application
    config.paths.add File.join('app', 'aggregators'), glob: File.join('**', '*.rb')
    config.autoload_paths += Dir[Rails.root.join('app', 'aggregators', '*')]
    config.paths.add File.join('app', 'sqls'), glob: File.join('**', '*.erb')
    config.autoload_paths += Dir[Rails.root.join('app', 'sqls', '*')]
  end
end

module Onepage
  class Application < Rails::Application
    if Rails.env.development?
      config.middleware.insert_before 0, Rack::Cors do
        allow do
          origins 'http://localhost:8081', 'http://localhost:5000'
          resource '*',
                   :headers => :any,
                   :methods => [:get, :post, :put, :patch, :delete, :options],
                   :expose => ['X-Total', 'X-Total-Pages', 'X-Per-Page', 'X-Page', 'X-Next-Page', 'X-Prev-Page', 'X-Offset'],
                   :credentials => true
        end
      end
    else
      config.middleware.insert_before 0, Rack::Cors do
        allow do
          origins '*'
          resource '*',
                   :headers => :any,
                   :methods => [:get, :post, :put, :patch, :delete, :options],
                   :expose => ['X-Total', 'X-Total-Pages', 'X-Per-Page', 'X-Page', 'X-Next-Page', 'X-Prev-Page', 'X-Offset']
        end
      end
    end
  end
end

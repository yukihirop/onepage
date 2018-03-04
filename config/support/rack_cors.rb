module Onepage
  class Application < Rails::Application
    if Rails.env.development?
      config.middleware.insert_before 0, Rack::Cors do
        allow do
          origins 'http://localhost:8081', 'http://localhost:5000'
          resource '*',
                   :headers => :any,
                   :methods => [:get, :post, :put, :patch, :delete, :options],
                   :credentials => true
        end
      end
    else
      config.middleware.insert_before 0, Rack::Cors do
        allow do
          origins '*'
          resource '*', :headers => :any, :methods => [:get, :post, :put, :patch, :delete, :options]
        end
      end
    end
  end
end

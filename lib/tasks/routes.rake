# 参考
# http://kzy52.com/entry/2014/11/07/084023

namespace :api do
  desc 'API Routes'
  task routes: :environment do
    API::Root.routes.each do |api|
      method = api.request_method.ljust(10)
      path = api.path.gsub(':version', api.version)
      puts "     #{method} #{path}"
    end
  end
end

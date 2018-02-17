# app/apiとするとNameError: uninitialized constant API
# https://stackoverflow.com/questions/29306703/rails-grape-api-nameerror-uninitialized-constant-api
module API
  class Root < Grape::API

    prefix 'api'

    mount API::V1::Root
  end
end

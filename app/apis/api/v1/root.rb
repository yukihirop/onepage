module API
  module V1
    class Root < Grape::API
      format :json
      default_format :json
      version 'v1'

      # active_model_serializerを使うために必要な設定
      use Grape::Middleware::Globals
      require 'grape/active_model_serializers'
      include Grape::ActiveModelSerializers

      # 例外バンドル 400
      rescue_from ActiveRecord::RecordNotFound do |e|
        rack_response({ message: e.message, status: 404 }.to_json, 404)
      end

      # 例外バンドル 400
      rescue_from Grape::Exceptions::ValidationErrors do |e|
        rack_response e.to_json, 400
      end

      # 例外バンドル 500
      rescue_from :all do |e|
        if Rails.env.development?
          raise e
        else
          error_response(message: "Internal server error", status: 500)
        end
      end

      mount API::V1::All::Users
      mount API::V1::All::Tags
      mount API::V1::All::Posts
      mount API::V1::CurrentUser::All::Posts
      mount API::V1::CurrentUser::All::Likes
      mount API::V1::CurrentUser::Post::Revisions
      mount API::V1::CurrentUser::Setting::Account
      mount API::V1::CurrentUser::Setting::Profile
      mount API::V1::User::Likes
      mount API::V1::Post::Likes

      add_swagger_documentation(
        info: {
          title: 'OnePage API V1',
          description: 'OnePageを外部アプリケーションから利用するためのAPIです',
        },
        api_version: 'v1',
        base_path: '/api',
        hide_documentation_path: true,
        hide_format: true
      )
    end
  end
end

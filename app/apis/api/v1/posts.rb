module API
  module V1
    class Posts < Grape::API
      use Grape::Middleware::Globals
      include Grape::ActiveModelSerializers

      helpers do
        def posts_with_user
          JSON.parse(ActiveModel::Serializer::CollectionSerializer.new(::Post.all, serializer: API::V1::PostSerializer).to_json)
        end
      end

      resource :posts do
        desc '投稿一覧を取得します'
        get do
          posts_with_user
        end
      end
    end
  end
end

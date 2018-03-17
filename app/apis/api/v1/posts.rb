module API
  module V1
    class Posts < Grape::API
      use Grape::Middleware::Globals
      include Grape::ActiveModelSerializers

      helpers do
        # userとrevisionとpost_likingsを持つ
        def serialized_posts
          JSON.parse(ActiveModel::Serializer::CollectionSerializer.new(API::V1::All::Post.all, serializer: API::V1::PostSerializer).to_json)
        end
      end

      resource :posts do
        desc '投稿一覧を取得します'
        get do
          serialized_posts
        end
      end
    end
  end
end

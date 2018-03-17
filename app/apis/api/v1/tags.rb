module API
  module V1
    class Tags < Grape::API
      use Grape::Middleware::Globals
      include Grape::ActiveModelSerializers

      helpers do
        # post_taggingsを持つ
        def serialized_tags
          JSON.parse(ActiveModel::Serializer::CollectionSerializer.new(API::V1::All::Tag.all, serializer: API::V1::TagSerializer).to_json)
        end
      end

      resource :tags do
        desc 'タグ一覧を取得します'
        get do
          serialized_tags
        end
      end
    end
  end
end

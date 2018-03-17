module API
  module V1
    class Tags < Grape::API
      use Grape::Middleware::Globals
      include Grape::ActiveModelSerializers

      helpers do
        def tags_with_post_taggings
          JSON.parse(ActiveModel::Serializer::CollectionSerializer.new(::Tag.all, serializer: API::V1::TagSerializer).to_json)
        end
      end

      resource :tags do
        desc 'タグ一覧を取得します'
        get do
          tags_with_post_taggings
        end
      end
    end
  end
end

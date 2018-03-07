module API
  module V1
    class Tags < Grape::API
      use Grape::Middleware::Globals
      include Grape::ActiveModelSerializers

      helpers do
        def tags_with_post_taggings
          ::Tag.all
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

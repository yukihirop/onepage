module API
  module V1
    class Tags < Grape::API
      helpers do
        def tags_with_post_taggings
          ::Pg::TagsWithPostTaggings.new.result
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

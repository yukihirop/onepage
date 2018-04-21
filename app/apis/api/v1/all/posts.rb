module API
  module V1
    module All
      class Posts < Grape::API
        use Grape::Middleware::Globals
        include Grape::ActiveModelSerializers
        include Grape::Kaminari

        helpers do
          # userとrevisionとpost_likingsを持つ
          def serialized_posts
            resource = ActiveModelSerializers::SerializableResource.new(
              paginated_posts,
              each_serializer: API::V1::PostSerializer,
              adapter: :json_api,
              serialization_context: ActiveModelSerializers::SerializationContext.new(request)
            )
            JSON.parse(resource.to_json)
          end

          def paginated_posts
            paginate(Post.all)
          end

          params :query_params do
            optional :page,     type: Integer, documentation: { params_type: 'query' }
            optional :per_page, type: Integer, documentation: { params_type: 'query' }
            optional :offset,   type: Integer, documentation: { params_type: 'query' }
          end
        end

        resource :posts do
          params do
            use :query_params
          end

          paginate per_page: 10, max_per_page: 20

          desc '投稿一覧を取得します'
          get do
            render serialized_posts
          end
        end
      end
    end
  end
end

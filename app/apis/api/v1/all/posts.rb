module API
  module V1
    module All
      class Posts < Grape::API
        use Grape::Middleware::Globals
        include Grape::ActiveModelSerializers
        include Grape::Kaminari

        # 参考
        # https://stackoverflow.com/questions/35344117/why-does-session-doesnt-work-in-grape-rails
        use ActionDispatch::Session::CookieStore, key: 'user_id'
        helpers API::V1::CurrentUser::Helpers::SessionHelper

        helpers do
          # userとrevisionとpost_likingsを持つ
          def serialized_posts
            resource = ActiveModelSerializers::SerializableResource.new(
              paginated_posts,
              each_serializer: serializer,
              adapter: :json_api,
              serialization_context: ActiveModelSerializers::SerializationContext.new(request)
            )
            JSON.parse(resource.to_json)
          end

          def paginated_posts
            paginate(filtered_posts)
          end

          def filtered_posts
            if post_params[:current_user_following_tags]
              current_user_tag_ids = current_user.tag_followings.pluck(:tag_id)
              API::V1::All::Post.where_filtered_by_tags(current_user_tag_ids)
            else
              API::V1::All::Post.all
            end
          end

          def serializer
            if post_params[:current_user_following_tags]
              CurrentUserFollowingTagsPostSerializer
            else
              PostSerializer
            end
          end

          def post_params
            ActionController::Parameters.new(params).permit(
              :page,
              :per_page,
              :offset,
              :current_user_following_tags
            )
          end

          params :query_params do
            optional :page,     type: Integer, documentation: { params_type: 'query' }
            optional :per_page, type: Integer, documentation: { params_type: 'query' }
            optional :offset,   type: Integer, documentation: { params_type: 'query' }
            optional :current_user_following_tags, type: Boolean, documentation: { params_type: 'query' }
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

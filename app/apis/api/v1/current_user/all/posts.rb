module API
  module V1
    module CurrentUser
      module All
        class Posts < Grape::API
          # 参考
          # https://stackoverflow.com/questions/35344117/why-does-session-doesnt-work-in-grape-rails
          use ActionDispatch::Session::CookieStore, key: 'user_id'
          helpers API::V1::CurrentUser::Helpers::SessionHelper

          use Grape::Middleware::Globals
          include Grape::ActiveModelSerializers
          include Grape::Kaminari

          helpers do
            def seiralized_posts
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
              if post_with_revision_params[:following_tags]
                current_user_tag_ids = current_user.tag_followings.pluck(:tag_id)
                API::V1::All::Post.where_filtered_by_tags(current_user_tag_ids)
              else
                Post.all
              end
            end

            def serializer
              if post_with_revision_params[:following_tags]
                FollowingTagsPostSerializer
              else
                PostSerializer
              end
            end

            def post_with_revision_params
              ActionController::Parameters.new(customize_params).permit(
                :page,
                :per_page,
                :offset,
                :following_tags,
                revisions_attributes_optional_attributes: %i[
                  title
                  summary
                  goal
                  comment
                  event_url
                  body
                  slide_url
                ]
              )
            end

            def customize_params
              if params["revisions_attributes"].nil?
                params
              else
                dup_params = params.dup
                dup_params["revisions_attributes"] = {}
                dup_params["revisions_attributes"]["1"] = params["revisions_attributes"].dup
                dup_params
              end
            end

            def set_post
              @post = current_user.posts.find(params[:id])
            end

            def revisions_each_related_post
              current_user.posts.map do |post|
                post.revisions.last
              end
            end

            # 参考
            # param_typeを指定しないとだめ
            # https://qiita.com/gamerinshaft/items/5cddcd38869d1238e688
            params :revisions_attributes do
              requires :revisions_attributes, type: Hash do
                requires :title,     type: String, documentation: { param_type: 'body' }
                requires :summary,   type: String, documentation: { param_type: 'body' }
                requires :goal,      type: String, documentation: { param_type: 'body' }
                optional :comment,   type: String, documentation: { param_type: 'body' }
                optional :event_url, type: String, documentation: { param_type: 'body' }
                requires :body,      type: String, documentation: { param_type: 'body' }
                optional :slide_url, type: String, documentation: { param_type: 'body' }
              end
            end

            params :revisions_attributes_optional do
              requires :revisions_attributes, type: Hash do
                optional :title,     type: String, documentation: { param_type: 'body' }
                optional :summary,   type: String, documentation: { param_type: 'body' }
                optional :goal,      type: String, documentation: { param_type: 'body' }
                optional :comment,   type: String, documentation: { param_type: 'body' }
                optional :event_url, type: String, documentation: { param_type: 'body' }
                optional :body,      type: String, documentation: { param_type: 'body' }
                optional :slide_url, type: String, documentation: { param_type: 'body' }
              end
            end
          end

          namespace 'current_user' do
            resource :posts do
              desc 'カレントユーザーの投稿一覧を取得します'
              get do
                revisions_each_related_post
              end

              desc 'カレントユーザーのidで指定された投稿を取得します'
              params do
                requires :id, type: Integer
              end
              get ':id' do
                set_post
                @post.revisions.last
              end

              desc 'カレントユーザーの投稿を作成します', {
                failure: [{ code: 422, message: 'Unprocessable Entity' }]
              }
              params do
                use :revisions_attributes
              end
              post do
                post = current_user.posts.build(post_with_revision_params)
                if post.save && post.update(newest_revision_id: post.revisions.last.id)
                  post.revisions.last
                else
                  status 422
                end
              end

              desc 'カレントユーザーのidで指定された投稿の更新をします', {
                failure: [{ code: 422, message: 'Unprocessable Entity' }]
              }
              params do
                requires :id, type: Integer
                use :revisions_attributes_optional
              end
              patch ':id' do
                set_post
               if @post.update(post_with_revision_params) && @post.update(newest_revision_id: @post.revisions.last.id)
                 @post.revisions.last
               else
                 status 422
               end
              end

              desc 'カレントユーザーのidで指定された投稿の更新をします', {
                failure: [{ code: 422, message: 'Unprocessable Entity' }]
              }
              params do
                requires :id, type: Integer
                use :revisions_attributes_optional
              end
              put ':id' do
                set_post
                if @post.update(post_with_revision_params)
                  @post.revisions.last
                else
                  status 422
                end
              end

              desc 'カレントユーザーのidで指定された投稿を削除します', {
                failure: [{ code: 422, message: 'Unprocessable Entity' }]
              }
              params do
                requires :id, type: Integer
              end
              delete ':id' do
                set_post
                newest_revision_of_post = @post.revisions.last.dup
                if @post.destroy
                  newest_revision_of_post
                else
                  status 422
                end
              end
            end
          end
        end
      end
    end
  end
end

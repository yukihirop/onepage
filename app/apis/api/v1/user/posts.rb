module API
  module V1
    module User
      class Posts < Grape::API
        helpers do
          def current_user
            id = params[:user_id] || params[:id]
            @current_uesr ||= ::User.find(id)
          end

          def post_with_revision_params
            ActionController::Parameters.new(customize_params).permit(
              revisions_attributes: %i[
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

          params :user_id do
            requires :user_id, type: Integer
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

        resource :users do
          params do
            use :user_id
          end

          route_param :user_id do
            resource :posts do
              desc '投稿一覧を取得します'
              get do
                current_user.posts
              end

              desc 'idで指定された投稿を取得します'
              params do
                requires :id, type: Integer
              end
              get ':id' do
                set_post
                @post
              end

              desc '投稿を作成します', {
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

              desc 'idで指定された投稿の更新をします', {
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

              desc 'idで指定された投稿の更新をします', {
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

              desc 'idで指定された投稿を削除します', {
                failure: [{ code: 422, message: 'Unprocessable Entity' }]
              }
              params do
                requires :id, type: Integer
              end
              delete ':id' do
                set_post
                if @post.destroy
                  @post
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

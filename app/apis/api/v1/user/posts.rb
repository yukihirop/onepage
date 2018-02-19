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
            ActionController::Parameters.new(params).permit(
              :newest_revision_id,
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

          def set_post
            @post = current_user.posts.find(params[:id])
          end

          params :user_id do
            requires :user_id, type: Integer
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
                # 参考
                # param_typeを指定しないとだめ
                # https://qiita.com/gamerinshaft/items/5cddcd38869d1238e688
                requires :newest_revision_id, type: Integer, documentation: { param_type: 'body' }
              end
              post do
                post = current_user.posts.build(post_with_revision_params)
                if post.save && post.update(newest_revision_id: post.revisions.last.id)
                  post
                else
                  status 422
                end
              end

              desc 'idで指定された投稿の更新をします', {
                failure: [{ code: 422, message: 'Unprocessable Entity' }]
              }
              params do
                requires :id, type: Integer
                optional :newest_revision_id, type: Integer, documentation: { param_type: 'body' }
              end
              patch':id' do
                set_post
                if @post.update(post_with_revision_params) && @post.update(newest_revision_id: @post.revisions.last.id)
                  @post
                else
                  status 422
                end
              end

              desc 'idで指定された投稿の更新をします', {
                failure: [{ code: 422, message: 'Unprocessable Entity' }]
              }
              params do
                requires :id, type: Integer
                optional :newest_revision_id, type: Integer, documentation: { param_type: 'body' }
              end
              put':id' do
                set_post
                if @post.update(post_with_revision_params)
                  @post
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

module API
  module V1
    class Revisions < Grape::API
      helpers do
        def current_user
          id = params[:user_id] || params[:id]
          @current_uesr ||= User.find(id)
        end

        def revision_params
          ActionController::Parameters.new(params).permit(
                                                    :title,
                                                    :summary,
                                                    :goal,
                                                    :comment,
                                                    :event_url,
                                                    :body,
                                                    :slide_url
          )
        end

        def set_post
          @post = current_user.posts.find(params[:post_id])
        end

        def set_revision
          @revision = @post.revisions.find(params[:id])
        end

        params :user_id do
          requires :user_id, type: Integer
        end

        params :post_id do
          requires :post_id, type: Integer
        end
      end

      resource :users do
        params do
          use :user_id
        end

        route_param :user_id do
          resource :posts do
            params do
              use :post_id
            end

            route_param :post_id do
              resource :revisions do

                desc '改訂履歴一覧を取得します'
                get do
                  set_post
                  @post.revisions
                end

                desc 'idで指定された改訂履歴を取得します'
                params do
                  requires :id, type: Integer
                end
                get ':id' do
                  set_post
                  set_revision
                  @revision
                end

                desc '改訂履歴を作成します', {
                  failure: [{ code: 422, message: 'Unprocessable Entity' }]
                }
                params do
                  # 参考
                  # param_typeを指定しないとだめ
                  # https://qiita.com/gamerinshaft/items/5cddcd38869d1238e688
                  requires :title,     type: String, documentation: { param_type: 'body' }
                  requires :summary,   type: String, documentation: { param_type: 'body' }
                  requires :goal,      type: String, documentation: { param_type: 'body' }
                  optional :comment,   type: String, documentation: { param_type: 'body' }
                  optional :event_url, type: String, documentation: { param_type: 'body' }
                  requires :body,      type: String, documentation: { param_type: 'body' }
                  optional :slide_url, type: String, documentation: { param_type: 'body' }
                end
                post do
                  set_post
                  revision = @post.revisions.build(revision_params)
                  if revision.save
                    revision
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
end

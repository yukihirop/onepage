module API
  module V1
    module Post
      class Likes < Grape::API
        # 参考
        # https://stackoverflow.com/questions/35344117/why-does-session-doesnt-work-in-grape-rails
        use ActionDispatch::Session::CookieStore, key: 'user_id'

        helpers API::V1::Helpers::SessionHelper
        helpers do
          def post_like_params
            ActionController::Parameters.new(params).permit(
              :from_user_id
            )
          end

          def set_post
            @post = current_user.posts.find(params[:post_id])
          end

          def set_post_like
            @post_like = @post.post_likes.find(params[:id])
          end

          params :post_id do
            requires :post_id, type: Integer
          end
        end

        resource :posts do
          params do
            use :post_id
          end

          route_param :post_id do
            resource :post_likes do
              desc '「いいね！」の一覧を取得します'
              get do
                set_post
                @post.post_likes
              end

              desc '「いいね！」を作成します', {
                failure: [{ code: 422, message: 'Unprocessable Entity' }]
              }
              params do
                # 参考
                # param_typeを指定しないとだめ
                # https://qiita.com/gamerinshaft/items/5cddcd38869d1238e688
                requires :from_user_id, type: Integer, documentation: { param_type: 'body' }
              end
              post do
                set_post
                post_like = @post.post_likes.build(post_like_params)
                if post_like.save
                  post_like
                else
                  status 422
                end
              end

              desc 'idで指定した「いいね！」を削除します', {
                failure: [{ code: 422, message: 'Unprocessable Entity' }]
              }
              params do
                requires :id, type: Integer
              end
              delete ':id' do
                set_post
                set_post_like
                if @post_like.destroy
                  @post_like
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

module API
  module V1
    class Revisions < Grape::API
      # 参考
      # https://stackoverflow.com/questions/35344117/why-does-session-doesnt-work-in-grape-rails
      use ActionDispatch::Session::CookieStore, key: 'user_id'

      helpers do
        def session
          env['rack.session']
        end

        # TODO: sessionに保持しておくものがuse_idでは実用的ではないので
        # あとで必ず書き換える必要がある。
        # faowighoiwh98haf0anwifahwioa
        # こんな感じのトークンになるように
        def current_user
          # TODO: あとで必ず修正する
          # sessionsのAPIを作るまではcurrent_uesrを参照したら現在のユーザー1のuser_idを設定するようにする
          session[:user_id] = 1 if Rails.env.development?
          return unless session[:user_id]
          return @current_user if defined?(@current_user)
          @current_user = ::User.find(session[:user_id])
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

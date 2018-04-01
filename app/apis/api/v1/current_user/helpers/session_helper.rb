module API
  module V1
    module CurrentUser
      module Helpers
        module SessionHelper
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
            @current_user = API::V1::CurrentUser::All::User.find(session[:user_id])
          end
        end
      end
    end
  end
end

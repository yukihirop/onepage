module API
  module V1
    class Users < Grape::API
      helpers do
        def user_params
          ActionController::Parameters.new(params).permit(:email)
        end

        def users_with_profile
          ::User.all
        end
      end

      resource :users do

        desc 'ユーザー一覧を取得します'
        get do
          users_with_profile
        end

        desc 'ユーザーを作成します', {
          failure: [{ code: 422, message: 'Unprocessable Entity' }]
        }
        params do
          # 参考
          # param_typeを指定しないとだめ
          # https://qiita.com/gamerinshaft/items/5cddcd38869d1238e688
          requires :email, type: String, documentation: { param_type: 'body' }
        end
        post do
          user = ::User.new(user_params)
          if user.save
            user
          else
            status 422
          end
        end
      end
    end
  end
end




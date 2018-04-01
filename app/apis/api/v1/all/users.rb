module API
  module V1
    module All
      class Users < Grape::API
        helpers do
          def user_params
            ActionController::Parameters.new(params).permit(:email)
          end

          # profileとpost_likingsを持つ
          def serialized_users
            JSON.parse(ActiveModel::Serializer::CollectionSerializer.new(API::V1::All::User.all, serializer: API::V1::UserSerializer).to_json)
          end
        end

        resource :users do
          desc 'ユーザー一覧を取得します'
          get do
            serialized_users
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
            user = API::V1::All::User.new(user_params)
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
end

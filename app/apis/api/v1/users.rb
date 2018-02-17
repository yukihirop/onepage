module API
  module V1
    class Users < Grape::API
      helpers do
        def user_params
          ActionController::Parameters.new(params).permit(:email)
        end

        def set_user
          @user = User.find(params[:id])
        end
      end

      resource :users do

        desc 'ユーザー一覧を取得します'
        get do
          User.all
        end

        desc 'idで指定されたユーザーを取得します'
        params do
          requires :id, type: Integer
        end
        get ':id' do
          User.find(params[:id])
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
          user = User.new(user_params)
          if user.save
            user
          else
            status 422
          end
        end

        desc 'idで指定されたユーザーの更新をします', {
          failure: [{ code: 422, message: 'Unprocessable Entity' }]
        }
        params do
          requires :id, type: Integer
          optional :email, type: String, documentation: { param_type: 'body' }
        end
        patch':id' do
          set_user
          if @user.update(user_params)
            @user
          else
            status 422
          end
        end

        desc 'idで指定されたユーザーの更新をします', {
          failure: [{ code: 422, message: 'Unprocessable Entity' }]
        }
        params do
          requires :id, type: Integer
          optional :email, type: String, documentation: { param_type: 'body' }
        end
        put':id' do
          set_user
          if @user.update(user_params)
            @user
          else
            status 422
          end
        end

        desc 'idで指定されたユーザーを削除します', {
          failure: [{ code: 422, message: 'Unprocessable Entity' }]
        }
        params do
          requires :id, type: Integer
        end
        delete ':id' do
          set_user
          if @user.destroy
            @user
          else
            status 422
          end
        end
      end
    end
  end
end




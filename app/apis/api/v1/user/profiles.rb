module API
  module V1
    module User
      class Profiles < Grape::API
        helpers do
          def current_user
            id = params[:user_id]
            @current_uesr ||= ::User.find(id)
          end

          def profile_params
            ActionController::Parameters.new(params).permit(
              :name,
              :kana,
              :organization,
              :introduction,
              :image
            )
          end

          def set_profile
            @profile = current_user.profile
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
            resource :profile do

              desc 'プロフィールを取得します'
              get do
                set_profile
                @profile
              end

              desc 'プロフィールを作成します', {
                failure: [{ code: 422, message: 'Unprocessable Entity' }]
              }
              params do
                # 参考
                # param_typeを指定しないとだめ
                # https://qiita.com/gamerinshaft/items/5cddcd38869d1238e688
                requires :name,         type: String, documentation: { param_type: 'body' }
                optional :kana,         type: String, documentation: { param_type: 'body' }
                optional :organization, type: String, documentation: { param_type: 'body' }
                optional :introduction, type: String, documentation: { param_type: 'body' }
                optional :image,        type: File,   documentation: { param_type: 'body' }
              end
              post do
                profile = current_user.build_profile(profile_params)
                if profile.save
                  profile
                else
                  status 422
                end
              end

              desc 'プロフィールの更新をします', {
                failure: [{ code: 422, message: 'Unprocessable Entity' }]
              }
              params do
                optional :name,         type: String, documentation: { param_type: 'body' }
                optional :kana,         type: String, documentation: { param_type: 'body' }
                optional :organization, type: String, documentation: { param_type: 'body' }
                optional :introduction, type: String, documentation: { param_type: 'body' }
                optional :image,        type: File,   documentation: { param_type: 'body' }
              end
              patch do
                set_profile
                if @profile.update(profile_params)
                  @profile
                else
                  status 422
                end
              end

              desc 'プロフィールの更新をします', {
                failure: [{ code: 422, message: 'Unprocessable Entity' }]
              }
              params do
                optional :name,         type: String, documentation: { param_type: 'body' }
                optional :kana,         type: String, documentation: { param_type: 'body' }
                optional :organization, type: String, documentation: { param_type: 'body' }
                optional :introduction, type: String, documentation: { param_type: 'body' }
                optional :image,        type: File,   documentation: { param_type: 'body' }
              end
              put do
                set_profile
                if @profile.update(profile_params)
                  @profile
                else
                  status 422
                end
              end

              desc 'プロフィールを削除します', {
                failure: [{ code: 422, message: 'Unprocessable Entity' }]
              }
              delete do
                set_profile
                if @profile.destroy
                  @profile
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

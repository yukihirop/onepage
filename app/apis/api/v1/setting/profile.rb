module API
  module V1
    module Setting
      class Profile < Grape::API
        # 参考
        # https://stackoverflow.com/questions/35344117/why-does-session-doesnt-work-in-grape-rails
        use ActionDispatch::Session::CookieStore, key: 'user_id'

        helpers API::V1::Helpers::SessionHelper
        helpers do
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
        end

        resource :settings do
          resource :profile do
            desc 'プロフィールを取得します'
            get do
              set_profile
              @profile
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
          end
        end
      end
    end
  end
end

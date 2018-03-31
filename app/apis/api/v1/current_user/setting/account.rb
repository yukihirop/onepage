module API
  module V1
    module CurrentUser
      module Setting
        class Account < Grape::API
          # 参考
          # https://stackoverflow.com/questions/35344117/why-does-session-doesnt-work-in-grape-rails
          use ActionDispatch::Session::CookieStore, key: 'user_id'

          helpers API::V1::CurrentUser::Helpers::SessionHelper
          helpers do
            def account_params
              ActionController::Parameters.new(params).permit(
                :email,
                :mention_name
              )
            end

            params :account_params do
              optional :email,         type: String, documentation: { param_type: 'body' }, regexp: /.+@.+/
              optional :mention_name,  type: String, documentation: { param_type: 'body' }
            end
          end

          namespace 'current_user' do
            resource :settings do
              resource :account do
                desc 'カレントユーザーのアカウント情報を取得します'
                get do
                  current_user
                end

                desc 'カレントユーザーのアカウント情報の更新をします', {
                  failure: [{ code: 422, message: 'Unprocessable Entity' }]
                }
                params do
                  use :account_params
                end
                patch do
                  if current_user.update(account_params)
                    current_user
                  else
                    status 422
                  end
                end

                desc 'カレントユーザーのアカウント情報の更新をします', {
                  failure: [{ code: 422, message: 'Unprocessable Entity' }]
                }
                params do
                  use :account_params
                end
                put do
                  if current_user.update(account_params)
                    current_user
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

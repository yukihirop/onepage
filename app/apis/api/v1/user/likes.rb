module API
  module V1
    module User
      class Likes < Grape::API
        helpers do
          def set_user
            # https://github.com/ruby-grape/grape#Current Route and Endpoint
            @user = API::V1::User::User.find_by(mention_name: params[:mention_name])
          end
        end

        route_param :mention_name, type: String do
          resource :likes do
            desc 'mention_nameで指定されたユーザーの「いいね！」の一覧を取得します'
            get do
              set_user
              # TODO: 現在は投稿に関する「いいね！」だけを考えているが、
              #       チャットに対しての「いいね！」も考えるようになったら、
              #       current_user.chat_likesも足すようにする。
              @user.post_likings
            end
          end
        end
      end
    end
  end
end

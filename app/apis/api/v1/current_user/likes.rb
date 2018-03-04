module API
  module V1
    module CurrentUser
      class Likes < Grape::API
        # 参考
        # https://stackoverflow.com/questions/35344117/why-does-session-doesnt-work-in-grape-rails
        use ActionDispatch::Session::CookieStore, key: 'user_id'

        helpers API::V1::Helpers::SessionHelper

        resource :likes do
          desc 'カレントユーザーの「いいね！」一覧を取得します'
          get do
            # TODO: 現在は投稿に関する「いいね！」だけを考えているが、
            #       チャットに対しての「いいね！」も考えるようになったら、
            #       current_user.chat_likesも足すようにする。
            current_user.post_likings
          end
        end
      end
    end
  end
end

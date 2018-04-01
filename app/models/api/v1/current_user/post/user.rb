# 使われていない
# current_userはあっちこっちで同じメソッドが参照されるので
# どれか一つのモデルを参照することになってしまう。
# API::V1::CurrentUser::Postスコープでは
# API::V1::CurrentUser::Post::Userを使いたいがAPI::V1::CurrentUser::All::Userを使っている。
class API::V1::CurrentUser::Post::User < API::V1::CurrentUser::All::User
end

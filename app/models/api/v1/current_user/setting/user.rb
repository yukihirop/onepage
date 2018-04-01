# 使われていない
# current_userはあっちこっちで同じメソッドが参照されるので
# どれか一つのモデルを参照することになってしまう。
# API::V1::CurrentUser::Settingスコープでは
# API::V1::CurrentUserSetting::Userを使いたいがAPI::V1::CurrentUser::All::Userを使っている。
class API::V1::CurrentUser::Setting::User < API::V1::CurrentUser::All::User
end

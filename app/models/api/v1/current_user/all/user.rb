class API::V1::CurrentUser::All::User < User
  has_many :posts, dependent: :destroy

  # API::V1::CurrentUser::Settingスコープのカレントユーザーで使用されるassociation
  has_one :profile, dependent: :destroy
end

class API::V1::CurrentUser::All::User < User
  has_many :posts, dependent: :destroy
end

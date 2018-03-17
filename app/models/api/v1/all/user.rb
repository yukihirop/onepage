class API::V1::All::User < User
  # https://qiita.com/junara/items/ca6f65d2f2a27f185f0e
  has_many :posts, dependent: :destroy
end

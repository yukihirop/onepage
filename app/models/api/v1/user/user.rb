class API::V1::User::User < User
  # https://qiita.com/junara/items/ca6f65d2f2a27f185f0e
  has_many :post_likings, class_name: 'PostLiking', dependent: :destroy
end

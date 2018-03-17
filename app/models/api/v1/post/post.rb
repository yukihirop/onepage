class API::V1::Post::Post < Post
  # https://qiita.com/junara/items/ca6f65d2f2a27f185f0e
  has_many :post_likings, class_name: 'Post::Liking', dependent: :destroy
end

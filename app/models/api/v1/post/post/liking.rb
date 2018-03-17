class API::V1::Post::Post::Liking < Post::Liking
  belongs_to :post, optional: true
end

class API::V1::Post::PostLiking < Post::Liking
  belongs_to :post, optional: true
end

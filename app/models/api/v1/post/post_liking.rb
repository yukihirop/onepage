class API::V1::Post::PostLiking < PostLiking
  belongs_to :post, optional: true
end

class API::V1::All::PostLiking < Post::Liking
  belongs_to :post, optional: true
  belongs_to :user, optional: true
end

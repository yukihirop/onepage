class API::V1::All::Post::Liking < Post::Liking
  belongs_to :post, optional: true
end

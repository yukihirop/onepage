class API::V1::User::Post::Liking < Post::Liking
  belongs_to :user, optional: true
end

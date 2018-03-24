class API::V1::User::PostLiking < Post::Liking
  belongs_to :user, optional: true
end

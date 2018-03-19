class API::V1::CurrentUser::All::Post::Liking < Post::Liking
  belongs_to :user, optional: true
end

class API::V1::CurrentUser::All::TagFollowing < TagFollowing
  belongs_to :user
  belongs_to :tag
end

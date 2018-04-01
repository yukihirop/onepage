class API::V1::CurrentUser::All::PostLiking < PostLiking
  belongs_to :post, optional: true
  belongs_to :user, optional: true
end

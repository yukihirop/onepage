class API::V1::User::PostLiking < PostLiking
  belongs_to :user, optional: true
end

class API::V1::CurrentUser::All::User < User
  has_many :posts, dependent: :destroy
  has_many :post_taggings, class_name: 'API::V1::CurrentUser::All::PostTagging', through: :posts
  # API::V1::CurrentUser::Settingスコープのカレントユーザーで使用されるassociation
  has_one :profile, dependent: :destroy
  has_many :post_likings, dependent: :destroy
  has_many :tag_followings, dependent: :destroy
  has_many :follows, dependent: :destroy
end

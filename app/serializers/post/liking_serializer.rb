class Post::LikingSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :post_id, :from_user_id, :created_at, :updated_at
end

class Post::TaggingSerializer < ActiveModel::Serializer
  attributes :id, :post_id, :tag_id, :created_at, :updated_at
end

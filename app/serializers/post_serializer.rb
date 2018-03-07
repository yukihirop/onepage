class PostSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :newest_revision_id, :created_at, :updated_at
end

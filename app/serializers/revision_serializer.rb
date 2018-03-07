class RevisionSerializer < ActiveModel::Serializer
  attributes :id, :post_id, :title, :summary, :goal, :event_url, :body, :slide_url, :created_at, :updated_at
end

class API::V1::PostSerializer < PostSerializer
  attributes :revision, :post_likings_count

  has_many :post_likings
  belongs_to :user

  def revision
    object.revisions.find(object.newest_revision_id)
  end

  def post_likings_count
    object.post_likings.count
  end
end

class API::V1::All::PostSerializer < PostSerializer
  attributes :user, :profile, :revision, :post_likings_count

  has_many :post_likings

  def user
    object.user
  end

  def profile
    object.user.profile
  end

  def revision
    object.revisions.find(object.newest_revision_id)
  end

  def post_likings_count
    object.post_likings.count
  end
end

# == Schema Information
#
# Table name: posts
#
#  id                 :integer          not null, primary key
#  user_id            :integer
#  newest_revision_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class PostSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :newest_revision_id, :created_at, :updated_at, :revision, :post_likings_count

  has_many :post_likings
  belongs_to :user

  def revision
    object.revisions.find(object.newest_revision_id)
  end

  def post_likings_count
    object.post_likings.count
  end
end

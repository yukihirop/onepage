# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TagSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at, :updated_at, :post_taggings_count

  has_many :post_taggings

  def post_taggings_count
    object.post_taggings.size
  end
end

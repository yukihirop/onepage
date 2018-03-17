class API::V1::TagSerializer < TagSerializer
  attributes :post_taggings_count

  has_many :post_taggings

  def post_taggings_count
    object.post_taggings.size
  end
end

class API::V1::UserSerializer < UserSerializer
  attributes :post_likings_count

  has_one :profile
  has_many :post_likings

  def post_likings_count
    object.post_likings.size
  end
end

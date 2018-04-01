class API::V1::All::Tag < Tag
  has_many :post_taggings, class_name: 'PostTagging'
end

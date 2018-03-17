class API::V1::All::PostTagging < Post::Tagging
  belongs_to :tag, optional: true
end

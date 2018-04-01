class API::V1::All::PostTagging < PostTagging
  belongs_to :tag, optional: true
end

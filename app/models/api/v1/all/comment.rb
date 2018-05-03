class API::V1::All::Comment < ::Comment
  belongs_to :user
  belongs_to :post
end

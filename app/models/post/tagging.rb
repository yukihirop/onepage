class Post::Tagging < ApplicationRecord
  belongs_to :post
  belongs_to :tag
end

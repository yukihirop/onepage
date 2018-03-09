# == Schema Information
#
# Table name: post_taggings
#
#  id         :integer          not null, primary key
#  post_id    :integer
#  tag_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post::TaggingSerializer < ActiveModel::Serializer
  attributes :id, :post_id, :tag_id, :created_at, :updated_at
end

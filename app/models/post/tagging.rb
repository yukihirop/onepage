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

class Post::Tagging < ApplicationRecord
  belongs_to :post, optional: true
  belongs_to :tag,  optional: true
end

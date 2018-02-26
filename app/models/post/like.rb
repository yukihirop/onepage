# == Schema Information
#
# Table name: post_likes
#
#  id           :integer          not null, primary key
#  post_id      :integer
#  from_user_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Post::Like < ApplicationRecord
  belongs_to :post
  belongs_to :user
end

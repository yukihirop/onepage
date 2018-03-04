# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  email        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  mention_name :string
#

class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_one :profile, dependent: :destroy
  has_many :post_likes, class_name: 'Post::Like', dependent: :destroy
end

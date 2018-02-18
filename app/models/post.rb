# == Schema Information
#
# Table name: posts
#
#  id                 :integer          not null, primary key
#  user_id            :integer
#  newest_revision_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Post < ApplicationRecord
  belongs_to :user

  has_many :revisions, dependent: :destroy
  accepts_nested_attributes_for :revisions

  has_many :post_likes, class_name: 'Post::Like', dependent: :destroy
end

# == Schema Information
#
# Table name: post_likings
#
#  id           :integer          not null, primary key
#  post_id      :integer
#  from_user_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#

class PostLiking < ApplicationRecord
end

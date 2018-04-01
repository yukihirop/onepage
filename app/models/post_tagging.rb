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

class PostTagging < ApplicationRecord
end

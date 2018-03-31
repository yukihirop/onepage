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

require 'rails_helper'

RSpec.describe Post, type: :model do
end

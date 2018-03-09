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

require 'rails_helper'

RSpec.describe Post::Tagging, type: :model do
  describe 'association' do
    it { is_expected.to belong_to(:post) }
    it { is_expected.to belong_to(:tag) }
  end
end

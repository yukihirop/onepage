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
  describe 'association' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:revisions) }
    it { is_expected.to accept_nested_attributes_for(:revisions) }
    it { is_expected.to have_many(:post_likings).dependent(:destroy) }
    it { is_expected.to have_many(:post_taggings).dependent(:destroy) }
  end
end

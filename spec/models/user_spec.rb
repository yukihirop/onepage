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

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'association' do
    it { is_expected.to have_many(:posts).dependent(:destroy) }
    it { is_expected.to have_one(:profile).dependent(:destroy) }
    it { is_expected.to have_many(:post_likings).dependent(:destroy) }
  end
end

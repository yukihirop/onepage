# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe 'association' do
    it { is_expected.to have_many(:post_taggings) }
  end
end

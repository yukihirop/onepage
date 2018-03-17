require 'rails_helper'

RSpec.describe API::V1::All::Tag, type: :model do
  describe 'association' do
    it { is_expected.to have_many(:post_taggings) }
  end
end

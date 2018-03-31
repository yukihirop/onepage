require 'rails_helper'

RSpec.describe API::V1::Post::PostLiking, type: :model do
  describe 'association' do
    it { is_expected.to belong_to(:post) }
  end
end

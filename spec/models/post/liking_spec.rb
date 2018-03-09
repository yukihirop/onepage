require 'rails_helper'

RSpec.describe Post::Liking, type: :model do
  describe 'association' do
    it { is_expected.to belong_to(:post) }
    it { is_expected.to belong_to(:user) }
  end
end

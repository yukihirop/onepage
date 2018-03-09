require 'rails_helper'

RSpec.describe Post::Tagging, type: :model do
  describe 'association' do
    it { is_expected.to belong_to(:post) }
    it { is_expected.to belong_to(:tag) }
  end
end

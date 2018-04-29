require 'rails_helper'

RSpec.describe API::V1::CurrentUser::All::Post, type: :model do
  describe 'association' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:post_taggings).class_name('API::V1::CurrentUser::All::PostTagging').dependent(:destroy) }
    it { is_expected.to have_many(:revisions) }
    it { is_expected.to accept_nested_attributes_for(:revisions) }
  end
end

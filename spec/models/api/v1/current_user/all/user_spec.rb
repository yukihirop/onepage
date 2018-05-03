require 'rails_helper'

RSpec.describe API::V1::CurrentUser::All::User, type: :model do
  describe 'association' do
    it { is_expected.to have_many(:posts).dependent(:destroy) }
    it { is_expected.to have_many(:post_taggings).class_name('API::V1::CurrentUser::All::PostTagging').through(:posts) }
    it { is_expected.to have_one(:profile).dependent(:destroy) }
    it { is_expected.to have_many(:post_likings).dependent(:destroy) }
    it { is_expected.to have_many(:tag_followings).dependent(:destroy) }
    it { is_expected.to have_many(:follows).dependent(:destroy) }
  end
end

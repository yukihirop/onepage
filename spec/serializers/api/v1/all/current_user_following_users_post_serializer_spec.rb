require 'rails_helper'

RSpec.describe API::V1::All::CurrentUserFollowingUsersPostSerializer, type: :serializer do
  describe 'attirbutes' do
    it { is_expected.to have_attribute(:user) }
    it { is_expected.to have_attribute(:profile) }
    it { is_expected.to have_attribute(:revision) }
    it { is_expected.to have_attribute(:post_likings_count) }
    it { is_expected.to have_attribute(:comments_count) }
  end

  describe 'instance methods' do
    let(:post) { create(:api_v1_post_with_revision_and_post_likings_and_user) }
    let(:serialized_post) { described_class.new(post) }

    describe '#user' do
      let(:result) { post.user }
      subject { serialized_post.user }

      it { is_expected.to eq result }
    end

    describe '#profile' do
      let(:result) { post.user.profile }
      subject { serialized_post.profile }

      it { is_expected.to eq result }
    end

    describe '#revision' do
      let(:result) { post.revisions.find(post.newest_revision_id) }
      subject { serialized_post.revision }

      it { is_expected.to eq result }
    end

    describe '#post_likings_count' do
      let(:result) { post.post_likings.count }
      subject { serialized_post.post_likings_count }

      it { is_expected.to eq result }
    end

    describe '#comments_count' do
      let(:result) { post.comments.count }
      subject { serialized_post.comments_count }

      it { is_expected.to eq result }
    end
  end
end
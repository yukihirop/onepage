require 'rails_helper'

RSpec.describe API::V1::All::CurrentUserFollowingUsersPostSerializer, type: :serializer do
  describe 'attirbutes' do
    it { is_expected.to have_attribute(:follower_profile) }
    it { is_expected.to have_attribute(:revision) }
    it { is_expected.to have_attribute(:post_liking) }
    it { is_expected.to have_attribute(:comment) }
    it { is_expected.to have_attribute(:resource_count) }
    it { is_expected.to have_attribute(:action_type) }
  end

  describe 'instance methods' do
    let(:post) { create(:api_v1_post_with_revision_and_post_likings_and_user) }
    let(:serialized_post) { described_class.new(post) }

    describe '#follower_profile' do
      let(:action_type) { nil }
      before { allow(serialized_post).to receive(:action_type).and_return(action_type) }

      subject { serialized_post.follower_profile }

      context 'action_typeが「post」の時' do
        let(:result) { post.user.profile }
        let(:action_type) { 'post' }

        it { is_expected.to eq result }
      end

      context 'action_typeが「post_liking」の時' do
        let(:result) { API::V1::All::User.find(serialized_post.post_liking.user_id).profile }
        let(:action_type) { 'post_liking' }

        it { is_expected.to eq result }
      end

      context 'action_typeが「comment」の時' do
        let(:result) { API::V1::All::User.find(serialized_post.comment.user_id).profile }
        let(:action_type) { 'comment' }

        it { is_expected.to eq result }
      end

      context 'action_typeがその他の時' do
        let(:result) { post.user.profile }
        let(:aciton_type) { '' }

        it { is_expected.to eq result }
      end
    end

    describe '#revision' do
      let(:result) { post.revisions.find(post.newest_revision_id) }
      subject { serialized_post.revision }

      it { is_expected.to eq result }
    end

    describe '#post_liking' do
      let(:result) { post.post_likings.find_by(post_id: post.id) }
      subject { serialized_post.post_liking }

      it { is_expected.to eq result }
    end

    describe '#comment' do
      let(:result) { post.comments.find_by(post_id: post.id) }
      subject { serialized_post.comment }

      it { is_expected.to eq result }
    end

    describe '#resource_count' do
      let(:action_type) { nil }
      before { allow(serialized_post).to receive(:action_type).and_return(action_type) }

      subject { serialized_post.resource_count }

      context 'action_typeが「post」の時' do
        let(:action_type) { 'post' }

        it { is_expected.to eq nil }
      end

      context 'action_typeが「post_liking」の時' do
        let(:action_type) { 'post_liking' }

        it { is_expected.to eq nil }
      end

      context 'action_typeが「comment」の時」' do
        let(:action_type) { 'comment' }
        let(:result) { post.comments.count }

        it { is_expected.to eq result }
      end

      context 'action_typeがその他の時' do
        let(:action_type) { '' }

        it { is_expected.to eq nil }
      end
    end

    describe '#action_type' do
      subject { serialized_post.action_type }

      context 'action_typeが存在する時' do
        let(:result) { post.action_type }

        before { post.action_type = 'comment' }

        it { is_expected.to eq result }
      end

      context 'action_typeが存在しない時' do
        let(:result) { '' }

        it { is_expected.to eq result }
      end
    end
  end
end

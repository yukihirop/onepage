require 'rails_helper'

RSpec.describe API::V1::All::CurrentUserFollowingUsers::PostWithActionType, type: :model do
  describe 'class methods' do
    let!(:current_user) { create(:api_v1_current_user_user) }
    let!(:current_user_followings_users) { create_list(:api_v1_user, 5) }
    let!(:current_user_follows) do
      current_user_followings_users.map(&:id).map { |to_user_id| create(:api_v1_current_user_follow, user: current_user, to_user_id: to_user_id) }
    end
    let!(:posts) do
      current_user_followings_users.map { |user| create(:api_v1_post, :with_revision, user: user) }
    end

    # TODO: あとで実装を見直したい
    before do
      # 「投稿に対してのコメントのレコード」と「投稿に対してのといいね！のレコード」を生成するタイミングをsleepでずらす
      sleep 1
      post = posts[1]
      sleep 1
      create(:api_v1_comment, post: post, user: current_user_followings_users.sample)

      sleep 1
      post = posts[0]
      sleep 1
      create(:api_v1_post_liking, post: post, user: current_user_followings_users.sample)
    end

    describe '.with_action_type' do
      context 'updated_at(desc)でソートする時' do
        let(:results) { described_class.where(id: posts.map(&:id)).to_a }

        subject { described_class.with_action_type(current_user_follows.pluck(:to_user_id)) }

        it { is_expected.to eq results }
        it 'recordのaction_typeは正しく設定されていること' do
          subject
          expect(subject[0].action_type).to eq :post_liking
          expect(subject[1].action_type).to eq :comment
          expect(subject[2].action_type).to eq :post
          expect(subject[3].action_type).to eq :post
          expect(subject[4].action_type).to eq :post
        end
      end
    end
  end
end

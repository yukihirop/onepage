require 'rails_helper'

module API
  module V1
    module CurrentUser
      RSpec.describe Likes, type: :request do
        let!(:current_user) { create(:api_v1_current_user_user) }
        let!(:post)         { create(:api_v1_current_user_post) }

        # helpersのメソッドのモックの仕方
        # https://github.com/ruby-grape/grape/pull/397
        before do
          Grape::Endpoint.before_each do |endpoint|
            endpoint.stub(:current_user).and_return current_user
          end
        end

        after { Grape::Endpoint.before_each nil }

        describe 'GET /current_user/likes' do
          # TODO: 現在は投稿に関する「いいね！」だけを考えているが、
          #       チャットに対しての「いいね！」も考えるようになったら、
          #       current_user.chat_likesも足すようにする。
          let!(:likes) { create_list(:api_v1_current_user_post_liking, 5, user: current_user, post: post) }
          let(:path)  { "/api/v1/current_user/likes" }

          before do
            get path
          end

          it 'ステータス200(OK)が返されること' do
            expect(response.status).to eq 200
          end

          it 'カレントユーザーの「いいね！」一覧がjsonで返ってくる' do
            actual   = JSON.parse(response.body)
            expected = likes.map { |like| JSON.parse(like.to_json) }
            expect(actual).to include_json expected
          end
        end
      end
    end
  end
end

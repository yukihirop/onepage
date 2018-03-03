require 'rails_helper'

module API
  module V1
    module CurrentUser
      RSpec.describe Likes, type: :request do
        let!(:current_user) { create(:user) }
        let!(:post)         { create(:post) }

        # helpersのメソッドのモックの仕方
        # https://github.com/ruby-grape/grape/pull/397
        before do
          Grape::Endpoint.before_each do |endpoint|
            endpoint.stub(:current_user).and_return current_user
          end
        end

        after { Grape::Endpoint.before_each nil }

        describe 'GET /posts' do
          # TODO: 現在は投稿に関する「いいね！」だけを考えているが、
          #       チャットに対しての「いいね！」も考えるようになったら、
          #       current_user.chat_likesも足すようにする。
          let!(:likes) { create_list(:post_like, 5, user: current_user, post: post) }
          let(:path)  { "/api/v1/likes" }

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

require 'rails_helper'

module API
  module V1
    module Post
      RSpec.describe Likes, type: :request do
        context 'ユーザーがいる場合' do
          let!(:user) { create(:api_v1_user_user) }

          describe 'GET /:mention_name/post_likes' do
            # TODO: 現在は投稿に関する「いいね！」だけを考えているが、
            #       チャットに対しての「いいね！」も考えるようになったら、
            #       current_user.chat_likesも足すようにする。
            let!(:post_likings) { create_list(:api_v1_user_post_liking, 5, user: user) }
            let(:path)       { "/api/v1/#{user.mention_name}/likes" }

            before do
              get path
            end

            it 'ステータス200(OK)が返ってくること' do
              expect(response.status).to eq 200
            end

            it 'ユーザーの「いいね！」一覧がjsonで返ってくる' do
              actual   = JSON.parse(response.body)
              expected = JSON.parse(post_likings.to_json)
              expect(actual).to include_json expected
            end
          end
        end
      end
    end
  end
end

require 'rails_helper'

module API
  module V1
    RSpec.describe Posts, type: :request do
      describe 'GET /posts' do
        let(:path) { '/api/v1/posts' }

        before do
          create(:api_v1_post_with_revision_and_post_likings_and_user)
          get path
        end

        it 'ステータス200(OK)が返ってくること' do
          expect(response.status).to eq 200
        end

        it 'タグ一覧がjsonで返ってくる' do
          serialized_posts = ActiveModel::Serializer::CollectionSerializer.new(API::V1::All::Post.all, serializer: PostSerializer).to_json
          actual   = JSON.parse(response.body)
          expected = JSON.parse(serialized_posts)
          expect(actual).to eq expected
        end
      end
    end
  end
end

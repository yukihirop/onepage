require 'rails_helper'

module API
  module V1
    RSpec.describe Tags, type: :request do
      let!(:post) { create(:post) }
      let!(:tag)  { create(:tag)  }

      describe 'GET /tags' do
        let!(:post_tagggings) { create_list(:post_tagging, 5, post: post, tag: tag) }
        let(:path) { '/api/v1/tags' }

        before do
          get path
        end

        it 'ステータス200(OK)が返ってくること' do
          expect(response.status).to eq 200
        end

        it 'タグ一覧がjsonで返ってくる' do
          serialized_tags = ActiveModel::Serializer::CollectionSerializer.new(::Tag.all, serializer: TagSerializer).to_json
          actual   = JSON.parse(response.body)
          expected = JSON.parse(serialized_tags)
          expect(actual).to eq expected
        end
      end
    end
  end
end

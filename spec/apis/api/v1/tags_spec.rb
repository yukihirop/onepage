require 'rails_helper'

module API
  module V1
    RSpec.describe Tags, type: :request do
      let!(:post) { create(:post) }
      let!(:tag)  { create(:tag)  }

      describe 'GET /tags' do
        let!(:post_tagggings) { create_list(:post_tagging, 5, post: post, tag: tag) }
        let(:tag_with_post_tags) { tag.to_json.merge({ 'post_taggings': post_tagggings.map(&:to_json) }) }
        let(:path) { '/api/v1/tags' }

        before do
          get path
        end

        it 'ステータス200(OK)が返ってくること' do
          expect(response.status).to eq 200
        end

        it 'タグ一覧がjsonで返ってくる' do
          tags_with_post_taggings = ::Pg::TagsWithPostTaggings.new.result
          actual   = JSON.parse(response.body)
          expected = tags_with_post_taggings
          expect(actual).to eq expected
        end
      end
    end
  end
end

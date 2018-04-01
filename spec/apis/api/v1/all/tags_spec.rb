require 'rails_helper'

module API
  module V1
    module All
      RSpec.describe Tags, type: :request do
        describe 'GET /tags' do
          let(:path) { '/api/v1/tags' }

          before do
            create(:api_v1_tag_with_post_taggings)
            get path
          end

          it 'ステータス200(OK)が返ってくること' do
            expect(response.status).to eq 200
          end

          it 'タグ一覧がjsonで返ってくる' do
            serialized_tags = ActiveModel::Serializer::CollectionSerializer.new(API::V1::All::Tag.all, serializer: TagSerializer).to_json
            actual   = JSON.parse(response.body)
            expected = JSON.parse(serialized_tags)
            expect(actual).to eq expected
          end
        end
      end
    end
  end
end

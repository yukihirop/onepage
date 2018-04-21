require 'rails_helper'

module API
  module V1
    module All
      RSpec.describe Posts, type: :request do
        # helpersのメソッドのモックの仕方
        # https://github.com/ruby-grape/grape/pull/397
        before do
          Grape::Endpoint.before_each do |endpoint|
            endpoint.stub(:paginated_posts).and_return Post.all
          end
        end

        after { Grape::Endpoint.before_each nil }

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
            resource = ActiveModelSerializers::SerializableResource.new(
              Post.all,
              each_serializer: API::V1::PostSerializer,
              adapter: :json_api,
              serialization_context: ActiveModelSerializers::SerializationContext.new(request)
            )
            actual   = JSON.parse(response.body)
            expected = JSON.parse(resource.to_json)
            expect(actual).to eq expected
          end
        end
      end
    end
  end
end

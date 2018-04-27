require 'rails_helper'

module API
  module V1
    module All
      RSpec.describe Posts, type: :request do
        let!(:current_user) { create(:api_v1_current_user_user) }

        # helpersのメソッドのモックの仕方
        # https://github.com/ruby-grape/grape/pull/397
        before do
          Grape::Endpoint.before_each do |endpoint|
            @instance = endpoint
            endpoint.stub(:paginated_posts).and_call_original
            endpoint.stub(:current_user).and_return current_user
          end
        end

        after { Grape::Endpoint.before_each nil }

        describe 'GET /posts' do
          let(:filtered_posts) { Post.all }
          let(:path) { '/api/v1/posts' }

          before do
            create(:api_v1_post_with_revision_and_post_likings_and_user)
            get path
          end

          it 'ステータス200(OK)が返ってくること' do
            expect(response.status).to eq 200
          end

          it '投稿一覧がjsonで返ってくる' do
            resource = ActiveModelSerializers::SerializableResource.new(
              @instance.paginate(filtered_posts),
              each_serializer: API::V1::All::PostSerializer,
              adapter: :json_api,
              serialization_context: ActiveModelSerializers::SerializationContext.new(request)
            )
            actual   = JSON.parse(response.body)
            expected = JSON.parse(resource.to_json)
            expect(actual).to eq expected
          end
        end

        describe ' GET /posts?current_user_tags=true' do
          let!(:current_user_tags) { create_list(:api_v1_current_user_tag_following, 5, user: current_user,) }
          let!(:posts_when_current_user_follow_tags) { create_list(:api_v1_post_with_revision_and_post_likings_and_user, 2, user: current_user) }
          let!(:filtered_posts) { API::V1::All::Post.where_filtered_by_tags(current_user_tags.pluck(:tag_id)) }
          let(:path) { '/api/v1/posts?current_user_tags=true' }

          before do
            # ダミーデータを用意する
            create_list(:api_v1_post_with_revision_and_post_likings_and_user, 5)
            get path
          end

          it 'ステータス200(OK)が返ってくること' do
            expect(response.status).to eq 200
          end

          it 'current_userがフォローしているタグの投稿一覧がjsonで返ってくる' do
            resource = ActiveModelSerializers::SerializableResource.new(
              @instance.paginate(filtered_posts),
              each_serializer: API::V1::All::PostSerializer,
              adapter: :json_api,
              serialization_context: ActiveModelSerializers::SerializationContext.new(request)
            )
            actual = JSON.parse(response.body)
            expected = JSON.parse(resource.to_json)
            expect(actual).to eq expected
          end
        end
      end
    end
  end
end

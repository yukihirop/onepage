require 'rails_helper'

module API
  module V1
    module Post
      RSpec.describe Likes, type: :request do
        let(:current_post) { create(:api_v1_post_post) }

        describe 'GET /posts/:post_id/post_likes' do
          let(:path)       { "/api/v1/posts/#{current_post.id}/post_likes" }

          before do
            create_list(:api_v1_post_post_liking, 5, post: current_post)
            get path
          end

          it 'ステータス200(OK)が返ってくること' do
            expect(response.status).to eq 200
          end
        end

        describe 'POST /posts/:post_id/post_likes' do
          let(:post_liking_params) { attributes_for(:api_v1_post_post_liking) }
          let(:path)             { "/api/v1/posts/#{current_post.id}/post_likes" }

          subject do
            post path, params: post_liking_params
          end

          context '正常に「いいね！」ができた時' do
            it 'ステータス201(OK)が返ってくること' do
              subject
              expect(response.status).to eq 201
            end
          end

          context '正常に「いいね！」ができなかった場合' do
            before do
              allow_any_instance_of(::Post::Liking).to receive(:save).and_return(false)
            end

            it 'ステータス422(unprocessable_entity)が返ってくること' do
              subject
              expect(response.status).to eq 422
            end
          end
        end

        describe 'DELETE /posts/:post_id/post_likes/:id' do
          let!(:post_liking) { create(:api_v1_post_post_liking, post: current_post) }

          context '正常に「いいね！」が見つかった場合' do
            let(:path) { "/api/v1/posts/#{current_post.id}/post_likes/#{post_liking.id}" }

            subject do
              delete path
            end

            context '正常に「いいね！」が削除された場合' do
              it 'ステータス200(OK)が返ってくること' do
                subject
                expect(response.status).to eq 200
              end

              it 'データベースからデータが削除されること' do
                expect { subject }.to change(::Post::Liking, :count).by(-1)
              end
            end

            context '正常に「いいね！」が削除されなかった場合' do
              before do
                allow_any_instance_of(::Post::Liking).to receive(:destroy).and_return(false)
              end

              it 'ステータス422(unprocessable_entity)が返ってくること' do
                subject
                expect(response.status).to eq 422
              end
            end
          end

          context '正常に「いいね！」が見つからなかった場合' do
            let(:path) { "/api/v1/posts/#{current_post.id}/post_likes/0" }

            before do
              delete path
            end

            it 'ステータス404(not_found)が返ってくること' do
              expect(response.status).to eq 404
            end
          end
        end
      end
    end
  end
end

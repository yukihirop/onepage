require 'rails_helper'

module API
  module V1
    module Post
      RSpec.describe Likes, type: :request do
        context 'curren_userがいる場合' do
          let(:current_user) { create(:user) }
          let(:current_post) { create(:post, user: current_user) }

          # helpersのメソッドのモックの仕方
          # https://github.com/ruby-grape/grape/pull/397
          before do
            Grape::Endpoint.before_each do |endpoint|
              endpoint.stub(:current_user).and_return current_user
            end
          end

          after { Grape::Endpoint.before_each nil }

          describe 'GET /posts/:post_id/post_likes' do
            let(:post_likes) { create_list(:post_likes, 5, post: current_post) }
            let(:path)       { "/api/v1/posts/#{current_post.id}/post_likes" }

            before do
              get path
            end

            it 'ステータス200(OK)が返ってくること' do
              expect(response.status).to eq 200
            end
          end

          describe 'POST /posts/:post_id/post_likes' do
            let(:post_like_params) { attributes_for(:post_like) }
            let(:path)             { "/api/v1/posts/#{current_post.id}/post_likes" }

            subject do
              post path, params: post_like_params
            end

            context '正常に「いいね！」ができた時' do
              it 'ステータス201(OK)が返ってくること' do
                subject
                expect(response.status).to eq 201
              end
            end

            context '正常に「いいね！」ができなかった場合' do
              before do
                allow_any_instance_of(::Post::Like).to receive(:save).and_return(false)
              end

              it 'ステータス422(unprocessable_entity)が返ってくること' do
                subject
                expect(response.status).to eq 422
              end
            end
          end

          describe 'DELETE /posts/:post_id/post_likes/:id' do
            let!(:post_like) { create(:post_like, post: current_post) }

            context '正常に「いいね！」が見つかった場合' do
              let(:path) { "/api/v1/posts/#{current_post.id}/post_likes/#{post_like.id}" }

              subject do
                delete path
              end

              context '正常に「いいね！」が削除された場合' do
                it 'ステータス200(OK)が返ってくること' do
                  subject
                  expect(response.status).to eq 200
                end

                it 'データベースからデータが削除されること' do
                  expect { subject }.to change(::Post::Like, :count).by(-1)
                end
              end

              context '正常に「いいね！」が削除されなかった場合' do
                before do
                  allow_any_instance_of(::Post::Like).to receive(:destroy).and_return(false)
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
end

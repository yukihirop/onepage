require 'rails_helper'

module API
  module V1
    module CurrentUser
      module Post
        RSpec.describe Revisions, type: :request do
          let!(:current_user) { create(:user) }
          let!(:current_post) { create(:post, user: current_user) }

          # helpersのメソッドのモックの仕方
          # https://github.com/ruby-grape/grape/pull/397
          before do
            Grape::Endpoint.before_each do |endpoint|
              endpoint.stub(:current_user).and_return current_user
            end
          end

          after { Grape::Endpoint.before_each nil }

          describe 'GET /current_user/posts/:post_id/revisions' do
            let(:revision) { create(:revision, post: current_post) }
            let(:path)     { "/api/v1/current_user/posts/#{current_post.id}/revisions" }

            before do
              get path
            end

            it 'ステータス200(OK)が返ってくること' do
              expect(response.status).to eq 200
            end
          end

          describe 'POST /current_user/posts/:post_id/revisions' do
            let(:revision_params) { attributes_for(:revision) }
            let(:path)            { "/api/v1/current_user/posts/#{current_post.id}/revisions" }

            subject do
              post path, params: revision_params
            end

            context '正常に改定履歴が作成された場合' do
              it 'ステータス201(OK)が返ってくること' do
                subject
                expect(response.status).to eq 201
              end
            end

            context '正常に改定履歴が作成されていない場合' do
              before do
                allow_any_instance_of(Revision).to receive(:save).and_return(false)
              end

              it 'ステータス422(unprocessable_entity)が返ってくること' do
                subject
                expect(response.status).to eq 422
              end
            end
          end

          describe 'GET /current_user/posts/:post_id/revisions/:id' do
            let!(:revision) { create(:revision, post: current_post) }

            context '正常に改定履歴が見つかった場合' do
              let(:path) { "/api/v1/current_user/posts/#{current_post.id}/revisions/#{revision.id}" }

              before do
                get path
              end

              it 'ステータス200(OK)が返ってくること' do
                expect(response.status).to eq 200
              end
            end

            context '正常に改訂履歴が見つからなかった場合' do
              let(:path) { "/api/v1/current_user/posts/#{current_post.id}/revisions/0" }

              before do
                get path
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

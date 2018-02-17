require 'rails_helper'

module API
  module V1
    RSpec.describe Posts, type: :request do
      let!(:current_user) { create(:user) }

      describe 'GET /users/:user_id/posts' do
        let(:posts) { create_list(:post, 5, user: current_user ) }
        let(:path)  { "/api/v1/users/#{current_user.id}/posts" }

        before do
          get path
        end

        it 'ステータス200(OK)が返されること' do
          expect(response.status).to eq 200
        end
      end

      describe 'POST /users/:user_id/posts' do
        let(:post_params) { attributes_for(:post) }
        let(:path)        { "/api/v1/users/#{current_user.id}/posts" }

        subject do
          post path, params: post_params
        end

        context '正常に投稿が作成された場合' do
          it 'ステータス201(created)が返されること' do
            subject
            expect(response.status).to eq 201
          end

          it 'データベースにデータが作成されること' do
            expect { subject }.to change(Post, :count).by(1)
          end
        end

        context '正常に投稿が作成されていない場合' do
          before do
            allow_any_instance_of(Post).to receive(:save).and_return(false)
          end

          it 'ステータス422(unprocessable_entity)が返ってくること' do
            subject
            expect(response.status).to eq 422
          end
        end
      end

      describe 'GET /users/:user_id/posts/:id' do
        let!(:post) { create(:post, user: current_user ) }

        context '正常に投稿が見つかった場合' do
          let(:path) { "/api/v1/users/#{current_user.id}/posts/#{post.id}" }

          before do
            get path
          end

          it 'ステータス200(OK)が返ってくること' do
            expect(response.status).to eq 200
          end
        end

        context '正常に投稿が見つからなかった場合' do
          let(:path) { "/api/v1/users/#{current_user.id}/posts/0" }

          before do
            get path
          end

          it 'ステータス404(not_found)が返ってくること' do
            expect(response.status).to eq 404
          end
        end

      end

      describe 'PATCH/PUT /users/:user_id/posts/:id (posts#update)' do
        let!(:post) { create(:post, user: current_user ) }

        context '正常に投稿が見つかった場合' do
          let(:path) { "/api/v1/users/#{current_user.id}/posts/#{post.id}" }

          subject do
            patch path, params: { newest_revision_id: 100 }
          end

          context '正常に投稿が更新された場合' do
            it 'ステータス200(OK)が返ってくること' do
              subject
              expect(response.status).to eq 200
            end

            it 'データベースの値が更新されること' do
              subject
              post.reload
              expect(post.newest_revision_id).to eq 100
            end
          end

          context '正常に投稿が更新されなかった場合' do
            before do
              allow_any_instance_of(Post).to receive(:update).and_return(false)
            end

            it 'ステータス422(unprocessable_entity)が返ってくること' do
              subject
              expect(response.status).to eq 422
            end
          end
        end

        context '正常に投稿が見つからなかった場合' do
          let(:path) { "/api/v1/users/#{current_user.id}/posts/0" }

          before do
            patch path, params: { post: { newest_revision_id: 100 } }
          end

          it 'ステータス404(not_found)が返ってくること' do
            expect(response.status).to eq 404
          end
        end
      end

      describe 'DELETE /users/:user_id/posts/:id (users#destroy)' do
        let!(:post) { create(:post, user: current_user) }

        context '正常に投稿が見つかった場合' do
          let(:path) { "/api/v1/users/#{current_user.id}/posts/#{post.id}" }

          subject do
            delete path
          end

          context '正常に投稿が削除された場合' do
            it 'ステータス200(OK)が返ってくること' do
              subject
              expect(response.status).to eq 200
            end

            it 'データベースからデータが削除されること' do
              expect { subject }.to change(Post, :count).by(-1)
            end
          end

          context '正常に投稿が削除されなかった場合' do
            before do
              allow_any_instance_of(Post).to receive(:destroy).and_return(false)
            end

            it 'ステータス422(unprocessable_entity)が返ってくること' do
              subject
              expect(response.status).to eq 422
            end
          end
        end

        context '正常に投稿が見つからなかった場合' do
          let(:path) { "/api/v1/users/#{current_user.id}/posts/0" }

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

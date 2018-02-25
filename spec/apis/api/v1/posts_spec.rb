require 'rails_helper'

module API
  module V1
    RSpec.describe Posts, type: :request do
      let!(:current_user) { create(:user) }

      describe 'GET /posts' do
        let!(:posts) { create_list(:post_with_revisions, 5, user: current_user) }
        let(:path)  { "/api/v1/posts" }

        before do
          get path
        end

        it 'ステータス200(OK)が返されること' do
          expect(response.status).to eq 200
        end

        it '投稿一覧(内容もあり)がjsonで返ってくる' do
          actual   = JSON.parse(response.body)
          expected = posts.map { |post| post.revisions.last }.map { |el| JSON.parse(el.to_json) }
          expect(actual).to include_json expected
        end
      end

      describe 'POST /posts' do
        let!(:post_params)                 { attributes_for(:post, newest_revision_id: nil) }
        let!(:revision_attributes_element) { attributes_for(:revision) }
        let!(:revisions_attributes)        { { revisions_attributes: revision_attributes_element } }
        let!(:post_with_revision_params)   { post_params.merge(revisions_attributes) }

        let(:path)                         { "/api/v1/posts" }

        subject do
          post path, params: post_with_revision_params
        end

        context '正常に投稿が作成された場合' do
          it 'ステータス201(created)が返されること' do
            subject
            expect(response.status).to eq 201
          end

          it 'データベースにデータが作成されること' do
            expect { subject }.to change(::Post, :count).by(1).and change(Revision, :count).by(1)
          end

          it '最新の改訂履歴を示すid(newest_revision_id)が更新されること' do
            subject
            expect(::Post.last.newest_revision_id).to eq ::Post.last.revisions.last.id
          end

          it '投稿(改訂履歴)のjsonが返ってくること' do
            subject
            actual   = JSON.parse(response.body)
            expected = revision_attributes_element
            expect(actual).to include_json expected
          end
        end

        context '正常に投稿が作成されていない場合' do
          before do
            allow_any_instance_of(::Post).to receive(:save).and_return(false)
          end

          it 'ステータス422(unprocessable_entity)が返ってくること' do
            subject
            expect(response.status).to eq 422
          end
        end
      end

      describe 'GET /posts/:id' do
        let!(:post) { create(:post_with_revisions, user: current_user) }

        context '正常に投稿が見つかった場合' do
          let(:path) { "/api/v1/posts/#{post.id}" }

          before do
            get path
          end

          it 'ステータス200(OK)が返ってくること' do
            expect(response.status).to eq 200
          end

          it '投稿(内容あり)がjsonで返ってくる' do
            subject
            actual   = JSON.parse(response.body)
            expected = JSON.parse(post.revisions.last.to_json)
            expect(actual).to eq expected
          end
        end

        context '正常に投稿が見つからなかった場合' do
          let(:path) { "/api/v1/posts/0" }

          before do
            get path
          end

          it 'ステータス404(not_found)が返ってくること' do
            expect(response.status).to eq 404
          end
        end
      end

      describe 'PATCH/PUT /posts/:id (posts#update)' do
        let!(:post) { create(:post_with_revisions, user: current_user) }

        let!(:post_params)                 { attributes_for(:post) }
        let!(:revision_attributes_element) { attributes_for(:revision, title: 'hogehoge') }
        let!(:revisions_attributes)        { { revisions_attributes: revision_attributes_element } }
        let!(:post_with_revision_params)   { post_params.merge(revisions_attributes) }

        context '正常に投稿が見つかった場合' do
          let(:path) { "/api/v1/posts/#{post.id}" }

          subject do
            patch path, params: post_with_revision_params
          end

          context '正常に投稿が更新された場合' do
            it 'ステータス200(OK)が返ってくること' do
              subject
              expect(response.status).to eq 200
            end

            it 'データベースの値が更新されること' do
              subject
              post.reload
              expect(post.revisions.last.title).to eq 'hogehoge'
            end

            it '改訂履歴のデータが新規に作成されること' do
              expect { subject }.to change(Revision, :count).by(1)
            end

            it '改定履歴のデータが新規に作成されること' do
              expect { subject }.to change(Revision, :count).by(1)
            end

            it '最新の改訂履歴を示すid(newest_revision_id)が更新されること' do
              subject
              expect(::Post.last.newest_revision_id).to eq ::Post.last.revisions.last.id
            end

            it '最新の改訂履歴のjsonが返ってくること' do
              subject
              actual   = JSON.parse(response.body)
              expected = revision_attributes_element
              expect(actual).to include_json expected
            end
          end

          context '正常に投稿が更新されなかった場合' do
            before do
              allow_any_instance_of(::Post).to receive(:update).and_return(false)
            end

            it 'ステータス422(unprocessable_entity)が返ってくること' do
              subject
              expect(response.status).to eq 422
            end
          end
        end

        context '正常に投稿が見つからなかった場合' do
          let(:path) { "/api/v1/posts/0" }

          before do
            patch path, params: post_with_revision_params
          end

          it 'ステータス404(not_found)が返ってくること' do
            expect(response.status).to eq 404
          end
        end
      end

      describe 'DELETE /posts/:id (users#destroy)' do
        let!(:post) { create(:post_with_revisions, user: current_user) }

        context '正常に投稿が見つかった場合' do
          let(:path) { "/api/v1/posts/#{post.id}" }

          subject do
            delete path
          end

          context '正常に投稿が削除された場合' do
            it 'ステータス200(OK)が返ってくること' do
              subject
              expect(response.status).to eq 200
            end

            it 'データベースからデータが削除されること' do
              expect { subject }.to change(::Post, :count).by(-1).and change(Revision, :count).by(-post.revisions.all.size)
            end

            it '削除された投稿(内容あり)がjsonで返ってくる' do
              newest_revision_of_post = post.revisions.last.dup
              subject
              actual   = JSON.parse(response.body)
              expected = JSON.parse(newest_revision_of_post.to_json)
              expect(actual).to eq expected
            end
          end

          context '正常に投稿が削除されなかった場合' do
            before do
              allow_any_instance_of(::Post).to receive(:destroy).and_return(false)
            end

            it 'ステータス422(unprocessable_entity)が返ってくること' do
              subject
              expect(response.status).to eq 422
            end
          end
        end

        context '正常に投稿が見つからなかった場合' do
          let(:path) { "/api/v1/posts/0" }

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

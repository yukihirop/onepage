require 'rails_helper'

module API
  module V1
    RSpec.describe Users, type: :request do

      describe 'GET /users' do
        let(:user) { create(:user) }
        let(:path) { '/api/v1/users' }

        before do
          get path
        end

        it 'ステータス200(OK)が返ってくること' do
          expect(response.status).to eq 200
        end
      end

      describe 'POST /users' do
        let(:user_params) { attributes_for(:user) }
        let(:path)        { '/api/v1/users' }

        subject do
          # キーワード引数paramsを省略できない
          # https://stackoverflow.com/questions/43797133/controller-spec-unknown-keyword-id
          post path, params: user_params
        end

        context '正常にユーザーが作成される場合' do
          it 'データベースにユーザーが作成されること' do
            expect { subject }.to change(::User, :count).by(1)
          end

          it 'ステータス201(created)が返されること' do
            subject
            expect(response.status).to eq 201
          end
        end

        context '正常にユーザーが作成されない場合' do
          before do
            allow_any_instance_of(::User).to receive(:save).and_return(false)
          end

          it 'ステータス422(unprocessable_entity)が返されること' do
            subject
            expect(response.status).to eq 422
          end
        end
      end

      describe 'GET /users/:id' do
        let!(:user) { create(:user) }

        context 'ユーザーが存在する場合' do
          let(:path)  { "/api/v1/users/#{user.id}" }

          before do
            get path
          end

          it 'ステータス200(OK)が返ってくること' do
            expect(response.status).to eq 200
          end
        end

        context 'ユーザーが存在しない場合' do
          let(:path)  { "/api/v1/users/0" }

          before do
            get path
          end

          it 'ステータス404(not_found)が返ってくること' do
            expect(response.status).to eq 404
          end
        end
      end

      describe 'PATCH /users/:id' do
        let!(:user) { create(:user) }

        context 'ユーザーが存在する場合' do
          let(:path) { "/api/v1/users/#{user.id}" }

          subject do
            patch path, params: { email: 'update@example.com' }
          end

          context '正常にユーザーを更新できた場合' do
            it 'ステータス200(OK)が返ってくること' do
              subject
              expect(response.status).to eq 200
            end

            it 'データベースの値が更新されていること' do
              subject
              user.reload
              expect(user.email).to eq 'update@example.com'
            end
          end

          context '正常にユーザーを更新できなかった場合' do
            before do
              allow_any_instance_of(::User).to receive(:update).and_return(false)
            end

            it 'ステータス422(unprocessable_entity)が返ってくること' do
              subject
              expect(response.status).to eq 422
            end
          end
        end

        context 'ユーザーが存在しない場合' do
          let(:path) { "/api/v1/users/0" }

          before do
            patch path, params: { email: 'update@example.com' }
          end

          it 'ステータス404(not_found)が返ってくること' do
            expect(response.status).to eq 404
          end
        end
      end

      describe 'DELETE /users/:id' do
        let!(:user) { create(:user, :with_profile_and_posts, posts_count: 5) }

        context 'ユーザーが存在する場合' do
          let(:path) { "/api/v1/users/#{user.id}" }

          subject do
            delete path
          end

          context '正常にユーザーを削除できた場合' do
            it 'ステータス200(OK)が返ってくること' do
              subject
              expect(response.status).to eq 200
            end

            it 'データベースからデータが削除されていること' do
              expect { subject }.to change(::User, :count).by(-1).and change(::Post, :count).by(-5).and change(::Profile, :count).by(-1)
            end
          end

          context '正常にユーザーを削除できなかった場合' do
            before do
              allow_any_instance_of(::User).to receive(:destroy).and_return(false)
            end

            it 'ステータス422(unprocessable_entity)が返ってくること' do
              subject
              expect(response.status).to eq 422
            end
          end
        end

        context 'ユーザーがいない場合' do
          let(:path) { "/api/v1/users/0" }

          subject do
            delete path
          end

          it 'ステータス404(not_found)が返ってくること' do
            subject
            expect(response.status).to eq 404
          end
        end
      end
    end
  end
end

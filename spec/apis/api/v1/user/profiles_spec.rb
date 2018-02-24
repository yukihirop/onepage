require 'rails_helper'

module API
  module V1
    module User
      RSpec.describe Profiles, type: :request do
        let!(:current_user) { create(:user) }

        describe 'POST /users/:user_id/profile' do
          let(:profile_params) { attributes_for(:profile) }
          let(:path)           { "/api/v1/users/#{current_user.id}/profile" }

          subject do
            post path, params: profile_params
          end

          context '正常にプロフィールが作成された場合' do
            it 'ステータス201(created)が返されること' do
              subject
              expect(response.status).to eq 201
            end

            it 'データベースにデータが作成されること' do
              expect { subject }.to change(::Profile, :count).by(1)
            end
          end

          context '正常にプロフィールが作成されていない場合' do
            before do
              allow_any_instance_of(::Profile).to receive(:save).and_return(false)
            end

            it 'ステータス422(unprocessable_entity)が返ってくること' do
              subject
              expect(response.status).to eq 422
            end
          end
        end

        describe 'GET /users/:user_id/profile' do
          let!(:profile) { create(:profile, user: current_user) }

          context '正常にプロフィールが見つかった場合' do
            let(:path) { "/api/v1/users/#{current_user.id}/profile" }

            before do
              get path
            end

            it 'ステータス200(OK)が返ってくること' do
              expect(response.status).to eq 200
            end
          end

          context '正常にプロフィールが見つからなかった場合' do
            let(:path) { "/api/v1/users/0/profile" }

            before do
              get path
            end

            it 'ステータス404(not_found)が返ってくること' do
              expect(response.status).to eq 404
            end
          end
        end

        describe 'PATCH/PUT /users/:user_id/profile' do
          let!(:profile)       { create(:profile, user: current_user) }
          let(:profile_params) { attributes_for(:profile, name: 'update') }

          context '正常に投稿が見つかった場合' do
            let(:path) { "/api/v1/users/#{current_user.id}/profile" }

            subject do
              patch path, params: profile_params
            end

            context '正常にプロフィールが更新された場合' do
              it 'ステータス200(OK)が返ってくること' do
                subject
                expect(response.status).to eq 200
              end

              it 'データベースの値が更新されること' do
                subject
                profile.reload
                expect(profile.name).to eq 'update'
              end
            end

            context '正常にプロフィールが更新されなかった場合' do
              before do
                allow_any_instance_of(::Profile).to receive(:update).and_return(false)
              end

              it 'ステータス422(unprocessable_entity)が返ってくること' do
                subject
                expect(response.status).to eq 422
              end
            end
          end

          context '正常にプロフィールが見つからなかった場合' do
            let(:path) { "/api/v1/users/0/profile" }

            before do
              patch path, params: profile_params
            end

            it 'ステータス404(not_found)が返ってくること' do
              expect(response.status).to eq 404
            end
          end
        end

        describe 'DELETE /users/:user_id/profile' do
          let!(:profile) { create(:profile, user: current_user) }

          context '正常にプロフィールが見つかった場合' do
            let(:path) { "/api/v1/users/#{current_user.id}/profile" }

            subject do
              delete path
            end

            context '正常にプロフィールが削除された場合' do
              it 'ステータス200(OK)が返ってくること' do
                subject
                expect(response.status).to eq 200
              end

              it 'データベースからデータが削除されること' do
                expect { subject }.to change(::Profile, :count).by(-1)
              end
            end

            context '正常にプロフィールが削除されなかった場合' do
              before do
                allow_any_instance_of(::Profile).to receive(:destroy).and_return(false)
              end

              it 'ステータス422(unprocessable_entity)が返ってくること' do
                subject
                expect(response.status).to eq 422
              end
            end
          end
        end
      end
    end
  end
end

require 'rails_helper'

module API
  module V1
    module CurrentUser
      module Setting
        RSpec.describe Profile, type: :request do
          let!(:current_user) { create(:user) }

          # helpersのメソッドのモックの仕方
          # https://github.com/ruby-grape/grape/pull/397
          before do
            Grape::Endpoint.before_each do |endpoint|
              endpoint.stub(:current_user).and_return current_user
            end
          end

          after { Grape::Endpoint.before_each nil }

          describe 'GET /current_user/settings/profile' do
            let!(:profile) { create(:profile, user: current_user) }

            context '正常にプロフィールが見つかった場合' do
              let(:path) { "/api/v1/current_user/settings/profile" }

              before do
                get path
              end

              it 'ステータス200(OK)が返ってくること' do
                expect(response.status).to eq 200
              end
            end
          end

          describe 'PATCH/PUT /current_user/settings/profile' do
            let!(:profile)       { create(:profile, user: current_user) }
            let(:profile_params) { attributes_for(:profile, name: 'update') }

            context '正常に投稿が見つかった場合' do
              let(:path) { "/api/v1/current_user/settings/profile" }

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
          end
        end
      end
    end
  end
end

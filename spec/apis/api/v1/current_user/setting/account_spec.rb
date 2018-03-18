require 'rails_helper'

module API
  module V1
    module CurrentUser
      module Setting
        RSpec.describe Account, type: :request do
          let!(:current_user) { create(:api_v1_current_user_setting_user) }

          # helpersのメソッドのモックの仕方
          # https://github.com/ruby-grape/grape/pull/397
          before do
            Grape::Endpoint.before_each do |endpoint|
              endpoint.stub(:current_user).and_return current_user
            end
          end

          after { Grape::Endpoint.before_each nil }

          describe 'GET /current_user/settings/account' do
            context '正常にプロフィールが見つかった場合' do
              let(:path) { "/api/v1/current_user/settings/account" }

              before do
                get path
              end

              it 'ステータス200(OK)が返ってくること' do
                expect(response.status).to eq 200
              end
            end
          end

          describe 'PATCH/PUT /current_user/settings/account' do
            let(:account_params) { attributes_for(:api_v1_current_user_setting_user, email: 'update@example.com') }

            context '正常に投稿が見つかった場合' do
              let(:path) { "/api/v1/current_user/settings/account" }

              subject do
                patch path, params: account_params
              end

              context '正常にプロフィールが更新された場合' do
                it 'ステータス200(OK)が返ってくること' do
                  subject
                  expect(response.status).to eq 200
                end

                it 'データベースの値が更新されること' do
                  subject
                  current_user.reload
                  expect(current_user.email).to eq 'update@example.com'
                end
              end

              context '正常にプロフィールが更新されなかった場合' do
                context '更新時の失敗の時' do
                  before do
                    allow_any_instance_of(::User).to receive(:update).and_return(false)
                  end

                  it 'ステータス422(unprocessable_entity)が返ってくること' do
                    subject
                    expect(response.status).to eq 422
                  end
                end
                context 'emailのフォーマットが不正の時' do
                  let(:account_params) { attributes_for(:api_v1_current_user_setting_user, email: 'update') }

                  it 'メッセージ「email is invalid」が返ってくること' do
                    subject
                    actual = JSON.parse(response.body).first
                    expect(actual['params']).to include 'email'
                    expect(actual['messages']).to include 'is invalid'
                  end

                  it 'ステータス400(Bad Request)が返ってくること' do
                    subject
                    expect(response.status).to eq 400
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

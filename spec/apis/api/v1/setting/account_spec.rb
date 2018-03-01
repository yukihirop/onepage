require 'rails_helper'

module API
  module V1
    module Setting
      RSpec.describe Account, type: :request do
        let!(:current_user) { create(:user) }

        # helpersのメソッドのモックの仕方
        # https://github.com/ruby-grape/grape/pull/397
        before do
          Grape::Endpoint.before_each do |endpoint|
            endpoint.stub(:current_user).and_return current_user
          end
        end

        after { Grape::Endpoint.before_each nil }

        describe 'GET /settings/account' do
          context '正常にプロフィールが見つかった場合' do
            let(:path) { "/api/v1/settings/account" }

            before do
              get path
            end

            it 'ステータス200(OK)が返ってくること' do
              expect(response.status).to eq 200
            end
          end
        end

        describe 'PATCH/PUT /settings/account' do
          let(:account_params) { attributes_for(:user, email: 'update@example.com') }

          context '正常に投稿が見つかった場合' do
            let(:path) { "/api/v1/settings/account" }

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
              before do
                allow_any_instance_of(::User).to receive(:update).and_return(false)
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

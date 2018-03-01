require 'rails_helper'

module API
  module V1
    RSpec.describe Users, type: :request do

      describe 'GET /users' do
        let!(:users) { create_list(:user_with_profile, 5) }
        let(:path) { '/api/v1/users' }

        before do
          get path
        end

        it 'ステータス200(OK)が返ってくること' do
          expect(response.status).to eq 200
        end

        it 'ユーザー一覧（内容あり)がjsonで返ってくる' do
          profiles_each_related_user = ::User.joins(:profile).select('users.*, profiles.*')
          actual   = JSON.parse(response.body)
          expected = JSON.parse(profiles_each_related_user.to_json)
          expect(actual).to include_json expected
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
    end
  end
end

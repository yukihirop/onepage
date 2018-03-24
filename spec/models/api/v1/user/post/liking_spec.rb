require 'rails_helper'

RSpec.describe API::V1::User::PostLiking, type: :model do
  describe 'association' do
    it { is_expected.to belong_to(:user) }
  end
end

require 'rails_helper'

RSpec.describe API::V1::User::User, type: :model do
  describe 'association' do
    it { is_expected.to have_many(:post_likings).dependent(:destroy) }
  end
end

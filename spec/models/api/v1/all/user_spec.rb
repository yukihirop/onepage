require 'rails_helper'

RSpec.describe API::V1::All::User, type: :model do
  describe 'association' do
    it { is_expected.to have_many(:posts).dependent(:destroy) }
    it { is_expected.to have_one(:profile).dependent(:destroy) }
    it { is_expected.to have_many(:post_likings).dependent(:destroy) }
    it { is_expected.to have_many(:comments).dependent(:destroy) }
  end
end

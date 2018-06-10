require 'rails_helper'

RSpec.describe API::V1::All::PostLikingSerializer do
  describe 'attirbutes' do
    it { is_expected.to have_attribute(:id) }
    it { is_expected.to have_attribute(:user_id) }
    it { is_expected.to have_attribute(:post_id) }
    it { is_expected.to have_attribute(:to_user_id) }
    it { is_expected.to have_attribute(:created_at) }
    it { is_expected.to have_attribute(:updated_at) }
  end
end

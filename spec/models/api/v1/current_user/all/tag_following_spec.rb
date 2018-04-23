require 'rails_helper'

RSpec.describe API::V1::CurrentUser::All::TagFollowing, type: :model do
  describe 'association' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:tag) }
  end
end

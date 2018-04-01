require 'rails_helper'

RSpec.describe API::V1::CurrentUser::All::User, type: :model do
  describe 'association' do
    it { is_expected.to have_many(:posts).dependent(:destroy) }
    it { is_expected.to have_one(:profile).dependent(:destroy) }
  end
end

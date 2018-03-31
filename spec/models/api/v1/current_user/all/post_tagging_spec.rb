require 'rails_helper'

RSpec.describe API::V1::CurrentUser::All::PostTagging, type: :model do
  describe 'association' do
    it { is_expected.to belong_to(:post) }
  end
end

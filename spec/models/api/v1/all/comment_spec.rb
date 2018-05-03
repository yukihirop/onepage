require 'rails_helper'

RSpec.describe API::V1::All::Comment, type: :model do
  describe 'association' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:post) }
  end
end

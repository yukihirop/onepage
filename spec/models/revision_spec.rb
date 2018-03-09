require 'rails_helper'

RSpec.describe Revision, type: :model do
  describe 'association' do
    it { is_expected.to belong_to(:post) }
  end
end

require 'rails_helper'

RSpec.describe API::V1::All::PostTagging, type: :model do
  describe 'association' do
    it { is_expected.to belong_to(:tag) }
    it { is_expected.to belong_to(:post) }
  end

  describe '.filtered_post_ids_by' do
    let!(:posts)   { create_list(:api_v1_post, 2) }
    let!(:tags)    { create_list(:api_v1_tag, 2) }
    let!(:tag_ids) { tags.pluck(:id) }
    let(:result)   { posts.pluck(:id) }

    subject { described_class.filtered_post_ids_by(tag_ids) }

    before do
      create(:api_v1_post_tagging, post: posts[0], tag: tags[0])
      create(:api_v1_post_tagging, post: posts[1], tag: tags[1])
    end

    it { is_expected.to eq result }
  end
end

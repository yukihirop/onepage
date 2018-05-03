require 'rails_helper'

RSpec.describe API::V1::All::Post, type: :model do
  describe 'association' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:revisions) }
    it { is_expected.to accept_nested_attributes_for(:revisions) }
    it { is_expected.to have_many(:post_likings).dependent(:destroy) }
    it { is_expected.to have_many(:post_taggings).dependent(:destroy) }
    it { is_expected.to have_many(:comments).dependent(:destroy) }
  end

  describe '.where_filtered_by_tags' do
    let!(:tag_ids)  { [1, 2] }
    let!(:post_ids) { [1, 2] }
    let(:result) { described_class.where(id: post_ids) }

    subject { described_class.where_filtered_by_tags(tag_ids) }

    before do
      create_list(:api_v1_post_with_revision_and_post_likings_and_user, 2)
      allow(API::V1::All::PostTagging).to receive(:filtered_post_ids_by).with(tag_ids).and_return(post_ids)
    end

    it { is_expected.to eq result }
  end
end

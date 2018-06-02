class API::V1::All::Post < Post
  # https://qiita.com/junara/items/ca6f65d2f2a27f185f0e
  belongs_to :user, optional: true

  has_many :revisions, dependent: :destroy
  accepts_nested_attributes_for :revisions

  has_many :post_likings, class_name: 'PostLiking', dependent: :destroy
  has_many :post_taggings, class_name: 'PostTagging', dependent: :destroy
  has_many :comments, dependent: :destroy

  scope :where_filtered_by_tags, ->(tag_ids) { where(id: API::V1::All::PostTagging.filtered_post_ids_by(tag_ids)) }

  attr_accessor :action_type
end

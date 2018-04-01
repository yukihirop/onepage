class API::V1::CurrentUser::All::Post < Post
  # https://qiita.com/junara/items/ca6f65d2f2a27f185f0e
  belongs_to :user, optional: true

  has_many :revisions, dependent: :destroy
  accepts_nested_attributes_for :revisions

  has_many :post_taggings, dependent: :destroy
end

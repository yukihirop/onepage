class Post < ApplicationRecord
  belongs_to :user
  has_many :revisions, dependent: :destroy
  accepts_nested_attributes_for :revisions
end

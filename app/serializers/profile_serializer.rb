class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :name, :kana, :organization, :introduction, :image, :created_at, :updated_at
end

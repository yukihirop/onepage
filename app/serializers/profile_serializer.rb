# == Schema Information
#
# Table name: profiles
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  name         :string
#  kana         :string
#  organization :string
#  introduction :text
#  image        :binary
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :name, :kana, :organization, :introduction, :image, :created_at, :updated_at
end

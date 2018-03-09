# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  email        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  mention_name :string
#

class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :mention_name, :created_at, :updated_at

  has_one :profile
end

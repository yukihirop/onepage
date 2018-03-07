class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :mention_name

  has_one :profile
end

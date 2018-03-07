class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :mention_name, :created_at, :updated_at

  has_one :profile
end

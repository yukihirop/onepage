# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TagSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at, :updated_at
end

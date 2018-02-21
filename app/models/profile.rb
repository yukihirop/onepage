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

class Profile < ApplicationRecord
  belongs_to :user
end

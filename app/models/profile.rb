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
  # https://qiita.com/junara/items/ca6f65d2f2a27f185f0e
  belongs_to :user, optional: true
end

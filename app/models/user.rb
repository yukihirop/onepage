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

class User < ApplicationRecord
end

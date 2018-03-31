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

require 'rails_helper'

RSpec.describe User, type: :model do
end

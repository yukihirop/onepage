# == Schema Information
#
# Table name: revisions
#
#  id         :integer          not null, primary key
#  post_id    :integer
#  title      :text
#  summary    :text
#  goal       :text
#  event_url  :text
#  body       :text
#  slide_url  :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  comment    :text
#

class Revision < ApplicationRecord
  belongs_to :post
end

# == Schema Information
#
# Table name: practices
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  craft_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Practice < ActiveRecord::Base
  attr_accessible :craft_id
  belongs_to :user

  validates :user_id,  presence: true # will always be created through user
  validates :craft_id, presence: true
end

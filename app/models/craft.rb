# == Schema Information
#
# Table name: crafts
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Craft < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true
end

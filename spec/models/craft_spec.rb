# == Schema Information
#
# Table name: crafts
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Craft do

  before do
  	@craft = Craft.new(name: "Chef")
  end

  subject { @craft }

  it { should respond_to(:name)}
  it { should be_valid }


  describe 'when name not present' do
  	before {@craft.name = nil}
  	it{should_not be_valid}
  end

end

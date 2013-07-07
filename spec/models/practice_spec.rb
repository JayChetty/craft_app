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

require 'spec_helper'

describe Practice do
	let(:user) { FactoryGirl.create(:user)}
	before do
		@practice = user.practices.build(craft_id: 1)
	end

	subject {@practice}

	it {should respond_to(:user_id)}
	it {should respond_to(:craft_id)}
	it {should respond_to(:user)}
  it {should respond_to(:craft)}
  its(:user) { should == user }
	it {should be_valid}


  describe "when user_id is not present" do
    before { @practice.user_id = nil }
    it { should_not be_valid }
  end

  describe "when craft_id is not present" do
    before { @practice.craft_id = nil }
    it { should_not be_valid }
  end

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Practice.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end    
end

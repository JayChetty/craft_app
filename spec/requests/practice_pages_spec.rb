require 'spec_helper'

describe "practice pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "creation" do
    before { visit new_practice_path }

    describe "with invalid information" do

      it "should not create a practice" do
        expect { click_button "Post" }.not_to change(Practice, :count)
      end

      describe "error messages" do
        before { click_button "Post" }
        it { should have_content('error') } 
      end
    end

    # describe "with valid information" do

    #   before do 
    #     Craft.create(name: "Chef")    
    #     # select "Chef", from:  "Craft" 
    #   end
    #   it "should create a practice" do
    #     expect { click_button "Post" }.to change(Practice, :count).by(1)
    #   end
    # end
  end

  describe "destruction" do
    before do 
      Craft.create(name: "Chef")
      user.practices.create!(craft_id: 1)
    end

    describe "as correct user" do
      before { visit user_path(user) }

      it "should delete a practice" do
        expect { click_link "delete" }.to change(Practice, :count).by(-1)
      end
    end
  end  
end

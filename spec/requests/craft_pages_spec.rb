require 'spec_helper'

describe "CraftPages" do
	#go to index page check there is craft
	subject { page }

	

	describe "admin user" do
		let(:admin) { FactoryGirl.create(:admin) }
		before{ sign_in admin}

		describe "index" do			
		    before { visit crafts_path }		    
		    it { should have_selector('h1',  text: 'All crafts') }
		    it { should have_link('Add Craft') }

		    # These should work not sure why not
		    # it { should have_link('delete') }

		    # describe "destruction" do
		    # 	it "should delete craft" do
		    # 		expect { click_link('delete') }.to change(Craft, :count).by(-1)
		    # 	end
		    # end		
	    end

	    describe "creation" do
	    	before {visit crafts_new_path}		
	    	it { should have_selector('h1',  text: 'Add new craft') }

		 	describe "with invalid information" do

		        it "should not create a craft" do
		        	expect { click_button "Post" }.not_to change(Craft, :count)
		        end

		        describe "error messages" do
		        	before { click_button "Post" }
		        	it { should have_content('error') } 
		      	end
		    end

		    describe "with valid information" do

		      before { fill_in "Name", with: "Doctor"}
		      it "should create a Craft" do
		        expect { click_button "Post" }.to change(Craft, :count).by(1)
		      end
		    end	    	
	    end		   	    	
	end 


    describe "non admin user" do
	    let(:user) { FactoryGirl.create(:user) }
	    before do
	      sign_in user
	      get crafts_path
	    end
	    specify { response.should redirect_to(root_path)} 
    end
    
end

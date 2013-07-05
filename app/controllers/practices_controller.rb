class PracticesController < ApplicationController
	before_filter :signed_in_user, only: [:create, :destroy]

	def create
		@practice = current_user.practices.build(params[:practice])
		if @practice.save
			flash[:success] = "Practice Created!"
			redirect_to user_path(current_user)
		else
			render 'new'
		end			
	end

	def destroy
		Practice.find(params[:id]).destroy
		flash[:success] = "Practice destroyed."
		redirect_to user_path(current_user)
	end

	def new	
		@practice = current_user.practices.build
	end
end
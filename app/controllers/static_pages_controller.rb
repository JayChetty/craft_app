class StaticPagesController < ApplicationController

  def home
		if signed_in?
			redirect_to user_path(current_user)
		end
  end

  def about
  end  

end

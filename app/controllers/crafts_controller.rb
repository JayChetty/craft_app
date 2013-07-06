class CraftsController < ApplicationController
  before_filter :admin_user

  def index  
    @crafts = Craft.paginate(page: params[:page])
  end

  def new
    @craft = Craft.new
  end

  def destroy
    Craft.find(params[:id]).destroy
    flash[:success] = "Craft destroyed."
    redirect_to crafts_path
  end

  def create
    @craft = Craft.new(params[:craft])
      if @craft.save
        flash[:success] = "Craft added"
        redirect_to crafts_path
      else
        render 'new'
      end
  end

end

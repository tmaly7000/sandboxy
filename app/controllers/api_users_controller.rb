class ApiUsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @data = ApiUser.simple_list
  end

  def new
    @api_user = ApiUser.new
  end

  def create

    @api_user = ApiUser.new(params[:api_user])
    if @api_user.save
      flash[:notice] = "API User added."

      # sends a 302 redirect request to the browser,
      # any existing variables are lost,
      # and the specified action will be executed

      redirect_to :action => 'index'
    else

      # will NOT execute the code in the specified action.
      # It will render the view only. Existing variables will not be lost.

      render :action => 'new'
    end

  end

  def destroy

    deleteMe = ApiUser.find(params[:id])
    if deleteMe
       deleteMe.destroy
    end

    respond_to do |format|
      format.html { redirect_to :action => 'index' }
      format.xml  { head :ok }
    end

  end

end

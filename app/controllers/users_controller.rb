class UsersController < ApplicationController

  def search
    @users = User.search(params[:keyword])
    respond_to do |format|
      format.html
      format.json
    end
  end


  def update
     if current_user.update(user_params)
        redirect_to :root
    else
      render :edit
    end
  end

  def new
  end

  def destroy
  end

 private
  def user_params
   params.require(:user).permit(:name, :email)
  end

end


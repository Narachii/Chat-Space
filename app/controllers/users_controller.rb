class UsersController < ApplicationController

  def search
    scope
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

  def scope
    @users = User.where('name LIKE(?)', "%#{params[:keyword]}%")
    respond_to do |format|
      format.html
      format.json
    end
  end
end


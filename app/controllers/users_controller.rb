class UsersController < ApplicationController

  def edit
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

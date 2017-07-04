class UsersController < ApplicationController

  def edit
  end

  def update
     if current_user.update(user_params)
        redirect_to :root
    else
      render "edit.html.haml"
    end
  end

 private

   def user_params
   params.require(:user).permit(:email, :name)
   end

  def move_to_index
  redirect_to controller: :messages, action: 'index'
  end
end

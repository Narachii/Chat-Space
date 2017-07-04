class UsersController < ApplicationController



  def edit
  end

  def update
     user = User.find(params[:id])
     user.update(user_params)
     move_to_index
  end

 private

   def user_params
   params.require(:user).permit(:email, :name)
   end

  def move_to_index
  redirect_to controller: :messages, action: 'index'
end



end

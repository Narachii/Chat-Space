class UsersController < ApplicationController

  def edit
  end

  def update
     user = User.find(current_user)
     user.update(user_params) if user.id == current_user.id
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


  # def update
  #    user = User.find(params[:id])
  #    user.update(name: user_params[:name], email: user_params[:email],id: current_user.id ) if user_id == current_user.id
  #    move_to_index
  # end

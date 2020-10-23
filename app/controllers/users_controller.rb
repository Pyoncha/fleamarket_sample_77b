class UsersController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_users, only: [:show, :edit, :update, :profile, :logout]
  

  def show
    if @users.show(users_params)
      redirect_to user_path(id:current_user)
   else
      render :root_path
   end
  end

  def create 
    
    
  end
  
  def edit
  end

  def update
    if @user.update(users_params)
       redirect_to users_path
    else
       render :profile
    end
  end 

  def profile
  end

  def logout
  end
  
private
  def set_users
    @users = current_user
  end

   def users_params
    params.require(:users).permit(:introduction )
   end
end


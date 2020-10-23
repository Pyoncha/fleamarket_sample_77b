class UsersController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_users, only: [:show, :edit, :update, :profile, :logout]
  

  def show
  end

  def create 
    if @users.create(users_params)
      redirect_to users_path
   else
      render :profile
   end
    
  end
  
  def edit
  end

  def update
  end 

  def profile
  end

  def logout
  end
  
private
  def set_users
    @users = User.all
  end

   def users_params
    params.require(:users).permit(
     :nickname, :introduction )
   end
end


class UsersController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :profile_logout, only: [:show]
  

  def show
  end

  def create 
  end
  
  

  def edit
  end

  def update
  end
  
private
  def profile_logout
    @users = User.all
  end

end

  
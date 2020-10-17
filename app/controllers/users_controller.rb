class UsersController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_users, only: [:show]
  

  def show
  end

  def create 
  end
  
  def edit
  end

  def update
  end
  
private
  def set_users
    @users = User.all
  end

end

  
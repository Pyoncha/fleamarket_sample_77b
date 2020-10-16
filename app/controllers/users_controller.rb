class UsersController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def users  
  end

  def show
  end

  def create 
  end

  
  def profile
    @user = User.new
  end

  def edit
  end

  def update
  end

  def logout
  end
  


end

  
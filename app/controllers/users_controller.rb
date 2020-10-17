class UsersController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def new 
  end

  def show
    @user = User.all
  end

  def create 
  end

  def create 
  end

  
  def profile_logout
    @user = User.all
  end

  def edit
  end

  def update
  end

# def logout
  # @user = User.find(params[:id])
# end
  


end

  
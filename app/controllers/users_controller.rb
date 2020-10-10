class UsersController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def users
    
  end



  
  def profile
    @user = User.new
  end

  


end

  
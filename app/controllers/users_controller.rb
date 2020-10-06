class UsersController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def users
    
  end
end
  # 伊藤足し
  def profile
    
  end


  # 伊藤足し
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birth_day])
  end
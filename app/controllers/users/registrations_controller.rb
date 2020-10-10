# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
   before_action :configure_sign_up_params, only: [:create]
  #  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  
  

  def new
   @user = User.new
  end

# 伊藤足し
  def create
    @user = User.new(sign_up_params)
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render :new and return
    end
    session["devise.regist_data"]= {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    @address = @user.build_user_address
    render :new_address
  end

  # def new_address
  # end

#伊藤足し
  def create_address
     @user = User.new(session["devise.regist_data"]["user"])
     @address = UserAddress.new(address_params)
     unless @address.valid?
     flash.now[:alert] = @address.errors.full_messages
      render :new_address and return
     end
    @user.build_user_address(@address.attributes)
    @user.save
    session["devise.regist_data"]["user"].clear
    sign_in(:user, @user)
  end



#伊藤足し
protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys:
              [:nickname, :first_name, :last_name,:first_name_kana, :last_name_kana ,:email, :birth_day ])
 end 

  def address_params
    params.require(:user_address).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code,  :prefecture, :city, :address, :building, :phone_number)
  end
end

 
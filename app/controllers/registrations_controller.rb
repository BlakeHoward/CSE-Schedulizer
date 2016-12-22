#Yuzhao Li created this page on 11/29/2016
#
#Modifications made by Jason Kline on 11/30/2016
class RegistrationsController < Devise::RegistrationsController

  layout "registerLayout"

  private

  def sign_up_params
    params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation, :major)
  end

  def account_update_params
    params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation, :current_password)
  end

end
class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:name, :username, :email, :password)
  end

  def account_update_params
    params.require(:user).permit(:name, :username, :password, :current_password)
  end

end

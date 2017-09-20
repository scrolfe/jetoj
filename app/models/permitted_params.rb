class PermittedParams < Struct.new(:params, :current_user)
  def user
    params.require(:user).permit(*user_attributes)
  end

  def user_attributes
    if current_user.admin?
      [:email, :password, :password_confirmation, :username, :first_name, :last_name, :admin, :avatar]
    else
      [:email, :password, :password_confirmation, :username, :first_name, :last_name, :avatar]
    end
  end
end

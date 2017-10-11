class AdminsController < ApplicationController
  before_action :authenticate_user!

  def new_user
    if current_user.admin?
      authorize! :manage, User
      @user = User.new
    else
      flash[:alert] = "You are not allowed to access this page."
      redirect_to "/"
    end
  end

  def create_user
    @user = User.new(user_params)
    authorize! :manage, User
    if @user.save
      redirect_to '/'
    else
      render 'new_user'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end

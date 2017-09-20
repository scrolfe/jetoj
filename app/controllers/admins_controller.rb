class AdminsController < ApplicationController
  def new_user
    authorize! :manage, User
    @user = User.new
    p "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    p @user
  end

  def create_user
    @user = User.new(permitted_params.user)
    authorize! :manage, User
    if @user.save

    else

    end
  end
end

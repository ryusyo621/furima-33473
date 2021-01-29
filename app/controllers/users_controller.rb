class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :first_name, :last_name, :huri_first_name, :huri_last_name)
  end
end

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to new_user_id_path
    else
      flash[:alert] = "Fix errors below"
      render :new
    end
  end

  def show
    @user = User.find params[:id]
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.present?
      @user.update user_params
      @user.update_attribute(:avatar, params[:user][:avatar])
    end 
    redirect_to user_path(current_user)
  end

  private

  def user_params
    params.require(:user).permit(:first_name,
                                 :last_name,
                                 :email,
                                 :password,
                                 :password_confirmation,
                                 :avatar)
  end
end

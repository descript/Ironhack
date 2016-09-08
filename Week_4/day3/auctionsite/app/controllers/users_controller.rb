class UsersController < ApplicationController

  def new
    @new_user = User.new
  end

  def show
    @users = User.all
  end

  def create
    @user = User.new(
    :name => params[:user][:name],
    :email => params[:user][:email]
    )
    @user.save
    redirect_to "/users"
  end

  def delete
    @userplaceholder = User.new(:name => "blank")
  end

  def destroy
    @user = User.find_by(email: params[:user][:email])
    @user.destroy
    redirect_to "/users"
  end

end

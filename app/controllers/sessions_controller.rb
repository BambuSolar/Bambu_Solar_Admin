class SessionsController < ApplicationController
  layout false

  def new

  end

  def create
    @user = User.where(user_name: params[:session][:user_name]).first
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/login' , notice: 'Usuario o contraseña inválidos'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

end

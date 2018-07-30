class SessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]

  def new
    @user = User.new
  end

  def create
    email = "#{session_params[:name]}@spokeandsail.com"
    if @user = login(email, session_params[:password])
      redirect_to root_path
    else
      flash.now[:error] = 'Login failed'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(:users, notice: 'Logged out!')
  end

  private

  def session_params
    params.require(:user).permit(:name, :password)
  end
end

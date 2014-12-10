class SessionsController < ApplicationController
  layout 'sessions'

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to :root
    else
      flash.now[:alert] = t('controllers.sessions.failed_auth')
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
  end
end

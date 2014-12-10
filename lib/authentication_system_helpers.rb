module AuthenticationSystemHelpers
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def signed_in?
    !current_user.nil?
  end

  def authorize
    if request.xhr?
      render nothing: true, status: 401 # HTTP 401: not authorized
    else
      redirect_to :new_sessions, alert: t('controllers.sessions.not_authorized') if current_user.nil?
    end
  end
end
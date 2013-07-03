class ApplicationController < ActionController::Base
  protect_from_forgery
  
  layout :choose_layout

  alias :login_required :authenticate_user!
  alias :logged_in? :user_signed_in?

  helper_method :logged_in?

  before_filter :set_current_user

  def after_sign_in_path_for(resource)
    dashboard_path
  end
 
private
  def redirect_admin
    if current_user && current_user.admin?
      redirect_to admin_path
    end
  end

  def set_current_user
    return true unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end
 
  def require_user
    redirect_to new_user_path unless session[:user_id]
    set_current_user
  end

  protected

  def choose_layout
    params[:layout].blank? ? 'dotgee' : params[:layout].to_s
  end
end

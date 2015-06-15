class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
 # before_filter :user_list1
  protected
  helper_method :pri
  #def user_list1
   # if user_signed_in?
    #      @subexist =  Follow.select('following_id').where(:user_id => current_user.id, :status => true)
     #     @alusers = User.select('id,user_name').all
  #  end
  #end
  
 before_action :set_locale
 
def set_locale
  if cookies[:educator_locale] && I18n.available_locales.include?(cookies[:educator_locale].to_sym)
    l = cookies[:educator_locale].to_sym
  else
    l = I18n.default_locale
    cookies.permanent[:educator_locale] = l
  end
  I18n.locale = l
end
  
  
def after_sign_in_path_for(resource)
  session[:previous_url] || root_path
end
  
  def pri(a)
    p a 
  end
  
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :user_name
    devise_parameter_sanitizer.for(:sign_up) << :first_name
    devise_parameter_sanitizer.for(:sign_up) << :last_name
    devise_parameter_sanitizer.for(:sign_up) << :avatar
    devise_parameter_sanitizer.for(:sign_up) << :is_admin
    devise_parameter_sanitizer.for(:sign_up) << :status
  end

 
end



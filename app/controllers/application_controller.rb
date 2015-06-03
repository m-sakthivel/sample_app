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



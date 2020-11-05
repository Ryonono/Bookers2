class ApplicationController < ActionController::Base
  #appliccationcontrollerにbefore_actionを記述してしまうと、topページも排除されてしまうので、今までtopページが作動しなかった
  #→以下の記述をbooks,usesrsに、exceptを使いながら使用するとうまく稼働する
  #before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(resource)
    #flash[:notice] ="Welcome! You have signed up successfully."
  end
  
  # def after_sign_out_path_for(resource)
  #   # user_path(resource)
  #   flash[:notice] ="Signed out successfully."
  # end
  
  

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name, :email])
  end

end
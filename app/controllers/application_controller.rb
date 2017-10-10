class ApplicationController < ActionController::Base
  # reset captcha code after each request for security
  after_filter :reset_last_captcha_code!

  # reset captcha code after each request for security
 

  protect_from_forgery with: :exception
  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to new_user_session_path
      ## if you want render 404 page
      ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
    end
end
def check_plan
  if current_user.plan_id.nil?
    redirect_to choose_plan_path
  else
    redirect_to admin_path
  end
 end
end

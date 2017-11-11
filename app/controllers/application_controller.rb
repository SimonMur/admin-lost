class ApplicationController < ActionController::Base
  after_action :reset_last_captcha_code!
  protect_from_forgery with: :exception
  # reset captcha code after each request for security

before_action :load_notification
  
 
	def load_notification
		if current_user
		@notifications = current_user.notifications.order('created_at DESC').limit(3)
	else
	end
	end


end

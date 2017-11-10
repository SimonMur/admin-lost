class ApplicationController < ActionController::Base
  # reset captcha code after each request for security
  after_action :reset_last_captcha_code!
before_action :load_notification
  # reset captcha code after each request for security
 
	def load_notification
		if current_user
		@notifications = current_user.notifications.order('created_at DESC').limit(3)
	else
	end
	end
  protect_from_forgery with: :exception

end

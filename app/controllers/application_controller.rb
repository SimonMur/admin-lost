class ApplicationController < ActionController::Base
  # reset captcha code after each request for security
  after_filter :reset_last_captcha_code!

  # reset captcha code after each request for security
 

  protect_from_forgery with: :exception
 

end

class PagesController < ApplicationController
 before_action :authenticate_user! 
 
 def welcome
 	@lostitems = current_user.lostitems
 	@notifications = current_user.notifications.order('created_at DESC').limit(3)
  @bar = current_user.lostitems.count.to_f  * 70
  end
  private

  def authenticate_user!
    if user_signed_in?
     super
    else
      redirect_to new_user_session_path
      ## if you want render 404 page
      ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
    end
end
end

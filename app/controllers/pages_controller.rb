class PagesController < ApplicationController
 before_action :authenticate_user! 
 before_action :check_plan
 def welcome
 	@lostitems = current_user.lostitems
 	@notifications = current_user.notifications.limit(3)
  @bar = (current_user.lostitems.count.to_f / current_user.plan.posts.to_f) * 100
  end
  private
def check_plan
  unless current_user.plan_id
    redirect_to choose_plan_path

  end
 end
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

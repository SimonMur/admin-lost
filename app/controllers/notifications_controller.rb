class NotificationsController < ApplicationController
  def link_through
  	@notification = Notification.find(params[:id])
  @notification.update read: true
  redirect_to notifications_path
  end
  def index
  	 @notifications = current_user.notifications
  end
end

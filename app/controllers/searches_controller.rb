class SearchesController < ApplicationController
  def search
  	 @usersfoundid_contacts = current_user.usersfoundid_contacts
  	 	@notifications = current_user.notifications.order('created_at DESC').limit(3)
  end

  def found
  		@notifications = current_user.notifications.order('created_at DESC').limit(3)
  end

  def lost
  		@notifications = current_user.notifications.order('created_at DESC').limit(3)
  end
end

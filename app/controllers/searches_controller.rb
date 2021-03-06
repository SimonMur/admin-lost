class SearchesController < ApplicationController
  def search
  	 @usersfoundid_contacts = current_user.usersfoundid_contacts.order('created_at DESC').paginate(page: params[:page], per_page: 5)
  	 	@notifications = current_user.notifications.order('created_at DESC').limit(3)
  end

  def found
    @foundid_details = FoundidDetail.all
  		@notifications = current_user.notifications.order('created_at DESC').limit(3)
  end

  def lost
    @lostid_details = LostidDetail.all
  		@notifications = current_user.notifications.order('created_at DESC').limit(3)
  end
end

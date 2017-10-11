class PagesController < ApplicationController
 before_action :authenticate_user! 
 before_action :check_plan
 def welcome
 	@lostitems = current_user.lostitems
  end
  private
def check_plan
  unless current_user.plan_id
    redirect_to choose_plan_path

  end
 end
 
end

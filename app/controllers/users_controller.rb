class UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :update, :destroy]
  def edit
  	 @plans = Plan.all
  end

  def show
     @notifications = current_user.notifications
     @plan = Plan.find(current_user.plan_id)
  end

  def index
  	@users = User.all
  end

  def update
      if current_user.update(plan_params)
        create_notification
        redirect_to admin_path, notice: 'you have selected your plan' 
      else
         redirect_to admin_path, notice: 'You have selected your plan.'
      end
  end

   def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Plan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = current_user
    end
 def plan_params
      params.require(:user).permit(:plan_id)
    end
    def create_notification
    Notification.create(user_id: current_user.id,
                  identifier: current_user.plan_id,
                        notice_type: 'Welcome, you have successfully selected your plan.')
end
end

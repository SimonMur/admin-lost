class UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :update, :destroy]
  def edit
  	 @plans = Plan.all
  end

  def show
  end

  def index
  	@users = User.all
  end
  def update
   
      if current_user.update(plan_params)
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
      @user = current_user.id
    end
 def plan_params
      params.require(:user).permit(:plan_id)
    end
end

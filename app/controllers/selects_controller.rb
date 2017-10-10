class SelectsController < ApplicationController
  def new
  	 @plans = Plan.all
  end
  def update
    respond_to do |format|
      if current_user.update(plan_params)
        format.html { redirect_to admin_path, notice: 'Plan was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  private
   def plan_params
      params.require(:user).permit(:plan_id)
    end
end

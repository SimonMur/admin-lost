class LostitemsController < ApplicationController
  before_action :set_lostitem, only: [:show, :edit, :update, :destroy]

  # GET /lostitems
  # GET /lostitems.json
  def index
    @lostitems = current_user.lostitems
    @notifications = current_user.notifications.limit(3)
    
  end

  # GET /lostitems/1
  # GET /lostitems/1.json
  def show
     @notifications = current_user.notifications.limit(3)
  end

  # GET /lostitems/new
  def new
    @lostitem = Lostitem.new
     @notifications = current_user.notifications.limit(3)
  end

  # GET /lostitems/1/edit
  def edit
  end

  # POST /lostitems
  # POST /lostitems.json
  def create
    @lostitem = Lostitem.new(lostitem_params)

    respond_to do |format|
      if @lostitem.save
        format.html { redirect_to edit_lostitem_path(@lostitem), notice: 'Lostitem was successfully created.' }
        format.json { render :show, status: :created, location: @lostitem }
      else
        format.html { render :new }
        format.json { render json: @lostitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lostitems/1
  # PATCH/PUT /lostitems/1.json
  def update
    respond_to do |format|
      if @lostitem.update(lostitem_params)
        format.html { redirect_to @lostitem, notice: 'Lostitem was successfully updated.' }
        format.json { render :show, status: :ok, location: @lostitem }
      else
        format.html { render :edit }
        format.json { render json: @lostitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lostitems/1
  # DELETE /lostitems/1.json
  def destroy
    @lostitem.destroy
    respond_to do |format|
      format.html { redirect_to lostitems_url, notice: 'Lostitem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lostitem
      @lostitem = Lostitem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lostitem_params
      params.require(:lostitem).permit(:type_id, :name,:status, :id_number, :pp_number, :reg_number, :other_number, :date_of_birth, :county_id, :location, :date_found, :description, :user_id, :picture_front, :picture_back, :county_born)
    end
end

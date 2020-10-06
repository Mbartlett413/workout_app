class WeeksController < ApplicationController
  before_action :set_week, only: [:show, :edit, :update, :destroy]
  protect_from_forgery prepend: true
  before_action :authenticate_user!

  # GET /weeks
  # GET /weeks.json
  def index
    @weeks = Week.all
  end

  # GET /weeks/1
  # GET /weeks/1.json
  def show
    #@wasp = Wasp.where(workout_id: params[:id])
    @wc = WeekCollection.where(week_id: params[:id])
  end

  # GET /weeks/new
  def new
    @week = Week.new
    @user = current_user
    @workouts = Workout.all
  end

  # GET /weeks/1/edit
  def edit
    @workouts = Workout.all
  end

  # POST /weeks
  # POST /weeks.json
  def create
    #@workout = Workout.new(workout_params)
    logger.debug("hitt #{params}")
    logger.debug("WHAT TRUCK #{params[:order_details]}")
    the_workouts = params[:order_details]['0']
    title = params[:title]
    user = User.find(params[:user]) 

    @week = Week.new
    @week.title = title
    logger.debug("Look here #{current_user}")
    #@workout.user = user
    
    respond_to do |format|
      if @week.save
        the_workouts.each do |x| 
          logger.debug("HERE IS x #{x}")
          @WC = WeekCollection.new
          @WC.week_id = @week.id
          @WC.workout_id = x
          @WC.save
        end 

        format.html { redirect_to @week, notice: 'Week was successfully created.' }
        format.json { render :show, status: :created, location: @week }
      else
        format.html { render :new }
        format.json { render json: @week.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weeks/1
  # PATCH/PUT /weeks/1.json
  def update
    respond_to do |format|
      if @week.update(week_params)
        format.html { redirect_to @week, notice: 'Week was successfully updated.' }
        format.json { render :show, status: :ok, location: @week }
      else
        format.html { render :edit }
        format.json { render json: @week.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weeks/1
  # DELETE /weeks/1.json
  def destroy
    @week.destroy
    respond_to do |format|
      format.html { redirect_to weeks_url, notice: 'Week was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_week
      @week = Week.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def week_params
      params.require(:week).permit(:title, :active_week)
    end
end

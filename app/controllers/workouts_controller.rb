class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :edit, :update, :destroy]
before_action :authenticate_user!, except: [:edit, :update, :new, :create]
  protect_from_forgery prepend: true
  
  # GET /workouts
  # GET /workouts.json
  def index
    @workouts = Workout.all
  end

  # GET /workouts/1
  # GET /workouts/1.json
  def show
    #@wasp = Wasp.where(workout_id: params[:id])
    logger.debug("HEREHERHEHR #{@wasp.inspect}")
  end

  # GET /workouts/new
  def new
    @user = current_user
    @workout = Workout.new
    @exercises = Exercise.all.sort_by { |obj| obj.title }
    @setReps = SetRep.all 
  end

  # GET /workouts/1/edit
  def edit
    @wasp = Wasp.new
    @exercise = Exercise.all.sort_by { |obj| obj.title }
    @setRep = SetRep.all
  end

  # POST /workouts
  # POST /workouts.json
  def create
    user = User.find(params[:user])
    workout_rep = params['order_details']
    the_title = params['title']

    @workout = Workout.new
    @workout.title = the_title
    @workout.user = user

    respond_to do |format|
      if @workout.save
      # Lets Boogie
        i = 0
        while i < workout_rep.length do
          @wasp = Wasp.new 
          @wasp.exercise_id = workout_rep[i]
          @wasp.workout_id = @workout.id
          @wasp.set_rep_id = workout_rep[i+1]
          @wasp.save
          i = i + 2
          logger.debug("THIS #{@wasp.inspect}")
        end 
      #
        format.html { redirect_to workouts_path, notice: 'Week was successfully created.' }
        format.json { render :show, status: :created, location: @workout }
      else
        format.html { render :new }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workouts/1
  # PATCH/PUT /workouts/1.json
  def update
    respond_to do |format|
      if @workout.update(workout_params)
        format.html { redirect_to @workout, notice: 'Workout was successfully updated.' }
        format.json { render :show, status: :ok, location: @workout }
      else
        format.html { render :edit }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workouts/1
  # DELETE /workouts/1.json
  def destroy
    @workout.destroy
    respond_to do |format|
      format.html { redirect_to workouts_url, notice: 'Workout was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workout
      @workout = Workout.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def workout_params
      params.require(:workout).permit(:title)
    end
end

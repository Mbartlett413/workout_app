class WaspsController < ApplicationController
	before_action :set_wasp, only: [:destroy]
	def update 
		logger.debug("params #{params}")
		@wasp = Wasp.find_by_id(params[:id])
		@wasp.update_attributes(:exercise_id => params[:wasp][:exercise_id], :set_rep_id =>params[:wasp][:set_rep_id])

	 	@workout = Workout.find_by_id(@wasp.workout_id)

	    respond_to do |format|
	        format.html { redirect_to edit_workout_path(@workout), notice: 'Workout was successfully updated.' }
	        format.json { render :show, status: :ok, location: @workout }
	    end
	end 

	def create 
		logger.debug("WORKING TO CREATE #{params}")
		@wasp = Wasp.new(set_rep_combo_params)
		@workout = Workout.find_by_id(@wasp.workout_id)

	    respond_to do |format|
	      if @wasp.save
	        format.html { redirect_to @workout, notice: 'Set rep was successfully created.' }
	        format.json { render :show, status: :created, location: @workout }
	      else
	        format.html { render :new }
	        format.json { render json: @workout.errors, status: :unprocessable_entity }
	      end
	    end
	end 

	# DELETE /set_reps/1
	# DELETE /set_reps/1.json
	def destroy
		logger.debug("blah blah #{@wasp}")
		@wasp.destroy
		respond_to do |format|
		  format.html { redirect_to workouts_url, notice: 'Set rep combo was successfully destroyed.' }
		  format.json { head :no_content }
		end
	end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wasp
      @wasp = Wasp.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def set_rep_combo_params
      params.require(:wasp).permit(:set_rep_id, :workout_id, :exercise_id)
    end
	#
end

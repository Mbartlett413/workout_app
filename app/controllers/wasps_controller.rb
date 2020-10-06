class WaspsController < ApplicationController

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
end

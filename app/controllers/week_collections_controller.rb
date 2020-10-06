class WeekCollectionsController < ApplicationController

	def update 
		logger.debug("params #{params}")
		@WC = WeekCollection.find_by_id(params[:id])
		@WC.update_attribute(:workout_id, params[:week_collection][:workout_id])

	 	@week = Week.find_by_id(@WC.week_id)

	    respond_to do |format|
	        format.html { redirect_to edit_week_path(@week), notice: 'Workout was successfully updated.' }
	        format.json { render :show, status: :ok, location: @week }
	    end

	end 

end

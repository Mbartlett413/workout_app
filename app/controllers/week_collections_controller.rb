class WeekCollectionsController < ApplicationController
	before_action :set_wc, only: [:destroy]

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

	def create 
		logger.debug("WORKING TO CREATE #{params}")
		@weekC = WeekCollection.new(set_rep_combo_params)
		@week = Week.find_by_id(@weekC.week_id)
		@workout = Workout.find_by_id(@weekC.workout_id)

	    respond_to do |format|
	      if @weekC.save
	        format.html { redirect_to @week, notice: 'Set rep was successfully created.' }
	        format.json { render :show, status: :created, location: @week }
	      else
	        format.html { render :new }
	        format.json { render json: @week.errors, status: :unprocessable_entity }
	      end
	    end
	end 

	# DELETE /set_reps/1
	# DELETE /set_reps/1.json
	def destroy
		logger.debug("blah blah #{@wc}")
		@wc.destroy
		respond_to do |format|
		  format.html { redirect_to weeks_url, notice: 'Workout was successfully removed.' }
		  format.json { head :no_content }
		end
	end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wc
      @wc = WeekCollection.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def set_rep_combo_params
      params.require(:week_collection).permit(:week_id, :workout_id)
    end
	#

end

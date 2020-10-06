class SetRepCombosController < ApplicationController
	before_action :authenticate_user!
	def update
		@src = SetRepCombo.find_by_id(params[:id])
		@src.update_attributes(:percent => params[:set_rep_combo][:percent], :reps =>params[:set_rep_combo][:reps])
		logger.debug(" wish #{params}")

	 	@setRep = SetRep.find_by_id(@src.set_rep_id)
	 	logger.debug("HERE #{@setRep}")
	    respond_to do |format|
	        format.html { redirect_to edit_set_rep_path(@setRep), notice: 'SetRep was successfully updated.' }
	        format.json { render :show, status: :ok, location: @setRep }
	    end
	end 
end

class SetRepCombosController < ApplicationController
	before_action :set_rep_combo, only: [:destroy]
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

	def create 
		logger.debug("WORKING TO CREATE #{params}")
		@set_rep_combo = SetRepCombo.new(set_rep_combo_params)
		@set_rep = SetRep.find_by_id(@set_rep_combo.set_rep_id)

	    respond_to do |format|
	      if @set_rep_combo.save
	        format.html { redirect_to @set_rep, notice: 'Set rep was successfully created.' }
	        format.json { render :show, status: :created, location: @set_rep }
	      else
	        format.html { render :new }
	        format.json { render json: @set_rep.errors, status: :unprocessable_entity }
	      end
	    end
	end 

	# DELETE /set_reps/1
	# DELETE /set_reps/1.json
	def destroy
		logger.debug("blah blah #{@set_rep_combo}")
		@set_rep_combo.destroy
		respond_to do |format|
		  format.html { redirect_to set_reps_url, notice: 'Set rep combo was successfully destroyed.' }
		  format.json { head :no_content }
		end
	end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rep_combo
      @set_rep_combo = SetRepCombo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def set_rep_combo_params
      params.require(:set_rep_combo).permit(:set_rep_id, :percent, :reps)
    end
end

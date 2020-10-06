class SetRepsController < ApplicationController
  before_action :set_set_rep, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:edit, :update, :new, :create]
  protect_from_forgery prepend: true
  # GET /set_reps
  # GET /set_reps.json
  def index
    @set_reps = SetRep.all
  end

  # GET /set_reps/1
  # GET /set_reps/1.json
  def show
  end

  # GET /set_reps/new
  def new
    @set_rep = SetRep.new
  end

  # GET /set_reps/1/edit
  def edit
  end

  # POST /set_reps
  # POST /set_reps.json
  def create
    logger.debug("hitt #{params}")
    #Params
    reps = params[:order_details]['0']
    set_percent = params[:order_details]['1']
    title = params[:title]

    @set_rep = SetRep.new
    @set_rep.title = title
    #@set_rep.setrep_value = setRepHash

    respond_to do |format|
      if @set_rep.save
        #
        i=0
        while i < set_percent.length do
          @src = SetRepCombo.new
          @src.set_rep_id = @set_rep.id
          logger.debug("percent #{set_percent[i]}")
          @src.percent = set_percent[i]
          logger.debug("reps #{reps[i]}")
          @src.reps = reps[i]
          @src.save
          logger.debug("here #{@src.inspect}")
          i = i + 1
        end 
        #

        format.html { redirect_to @set_rep, notice: 'Set rep was successfully created.' }
        format.json { render :show, status: :created, location: @set_rep }
      else
        format.html { render :new }
        format.json { render json: @set_rep.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /set_reps/1
  # PATCH/PUT /set_reps/1.json
  def update
    respond_to do |format|
      if @set_rep.update(set_rep_params)
        format.html { redirect_to @set_rep, notice: 'Set rep was successfully updated.' }
        format.json { render :show, status: :ok, location: @set_rep }
      else
        format.html { render :edit }
        format.json { render json: @set_rep.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /set_reps/1
  # DELETE /set_reps/1.json
  def destroy
    @set_rep.destroy
    respond_to do |format|
      format.html { redirect_to set_reps_url, notice: 'Set rep was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_set_rep
      @set_rep = SetRep.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def set_rep_params
      params.require(:set_rep).permit(:title)
    end
end

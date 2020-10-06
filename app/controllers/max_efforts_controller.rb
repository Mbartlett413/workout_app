class MaxEffortsController < ApplicationController
  before_action :set_max_effort, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /max_efforts
  # GET /max_efforts.json
  def index
    @max_efforts = MaxEffort.all
  end

  # GET /max_efforts/1
  # GET /max_efforts/1.json
  def show
  end

  # GET /max_efforts/new
  def new
    @max_effort = MaxEffort.new
  end

  # GET /max_efforts/1/edit
  def edit
  end

  # POST /max_efforts
  # POST /max_efforts.json
  def create
    @max_effort = MaxEffort.new(max_effort_params)
    @max_effort.user = current_user

    respond_to do |format|
      if @max_effort.save
        format.html { redirect_to @max_effort, notice: 'Max effort was successfully created.' }
        format.json { render :show, status: :created, location: @max_effort }
      else
        format.html { render :new }
        format.json { render json: @max_effort.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /max_efforts/1
  # PATCH/PUT /max_efforts/1.json
  def update
    respond_to do |format|
      if @max_effort.update(max_effort_params)
        format.html { redirect_to @max_effort, notice: 'Max effort was successfully updated.' }
        format.json { render :show, status: :ok, location: @max_effort }
      else
        format.html { render :edit }
        format.json { render json: @max_effort.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /max_efforts/1
  # DELETE /max_efforts/1.json
  def destroy
    @max_effort.destroy
    respond_to do |format|
      format.html { redirect_to max_efforts_url, notice: 'Max effort was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_max_effort
      @max_effort = MaxEffort.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def max_effort_params
      params.require(:max_effort).permit(:max_amount, :exercise_id, :user_id)
    end
end

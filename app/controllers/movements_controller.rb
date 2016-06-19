class MovementsController < ApplicationController
  load_and_authorize_resource
  before_action :set_movement, only: [:show, :edit, :update, :destroy]

  # GET /movements
  # GET /movements.json
  def index
    @movements = Movement.all
    @movement = Movement.new
  end

  # GET /movements/1
  # GET /movements/1.json
  def show
    @movement = Movement.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = MovementPdf.new(@movement, view_context)
        send_data pdf.render, filename: "movimiento_#{@movement.id}.pdf",
                              type: "application/pdf",
                              #page_size: "EXECUTIVE",
                              disposition: "inline"
      end
    end
  end

  # GET /movements/new
  def new
    @movement = Movement.new
  end

  # GET /movements/1/edit
  def edit
  end

  # POST /movements
  # POST /movements.json
  def create
    @movement = Movement.new(movement_params)
   
    respond_to do |format|
      if @movement.save
        format.html { redirect_to movements_path, notice: 'El registro fue creado exitosamente.' }
        format.json { render :show, status: :created, location: @movement }
      else
        format.html { render :new }
        format.json { render json: @movement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movements/1
  # PATCH/PUT /movements/1.json
  def update
    respond_to do |format|
      if @movement.update(movement_params)
        format.html { redirect_to movements_path, notice: 'El registro fue editado exitosamente.' }
        format.json { render :show, status: :ok, location: @movement }
      else
        format.html { render :edit }
        format.json { render json: @movement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movements/1
  # DELETE /movements/1.json
  def destroy
    @movement.destroy
    respond_to do |format|
      format.html { redirect_to movements_url, notice: 'El registro fue eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movement
      @movement = Movement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movement_params
      params.require(:movement).permit(:fecha, :motive_id, :person_id, d_movements_attributes: [:id, :product_id, :cantidad, :costo, :_destroy])
    end
end

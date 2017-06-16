class TipoTransportesController < ApplicationController
  before_action :set_tipo_transporte, only: [:show, :edit, :update, :destroy]

  # GET /tipo_transportes
  # GET /tipo_transportes.json
  def index
    @tipo_transportes = TipoTransporte.all
  end

  # GET /tipo_transportes/1
  # GET /tipo_transportes/1.json
  def show
  end

  # GET /tipo_transportes/new
  def new
    @tipo_transporte = TipoTransporte.new
  end

  # GET /tipo_transportes/1/edit
  def edit
  end

  # POST /tipo_transportes
  # POST /tipo_transportes.json
  def create
    @tipo_transporte = TipoTransporte.new(tipo_transporte_params)

    respond_to do |format|
      if @tipo_transporte.save
        format.html { redirect_to @tipo_transporte, notice: 'Tipo transporte was successfully created.' }
        format.json { render :show, status: :created, location: @tipo_transporte }
      else
        format.html { render :new }
        format.json { render json: @tipo_transporte.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_transportes/1
  # PATCH/PUT /tipo_transportes/1.json
  def update
    respond_to do |format|
      if @tipo_transporte.update(tipo_transporte_params)
        format.html { redirect_to @tipo_transporte, notice: 'Tipo transporte was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipo_transporte }
      else
        format.html { render :edit }
        format.json { render json: @tipo_transporte.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_transportes/1
  # DELETE /tipo_transportes/1.json
  def destroy
    @tipo_transporte.destroy
    respond_to do |format|
      format.html { redirect_to tipo_transportes_url, notice: 'Tipo transporte was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_transporte
      @tipo_transporte = TipoTransporte.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_transporte_params
      params.require(:tipo_transporte).permit(:cod_tiptrans, :integer, :nom_tiptrans)
    end
end

class ProdAlmasController < ApplicationController
  before_action :set_prod_alma, only: [:show, :edit, :update, :destroy]

  # GET /prod_almas
  # GET /prod_almas.json
  def index
    @prod_almas = ProdAlma.all
  end

  # GET /prod_almas/1
  # GET /prod_almas/1.json
  def show
  end

  # GET /prod_almas/new
  def new
    @prod_alma = ProdAlma.new
  end

  # GET /prod_almas/1/edit
  def edit
  end

  # POST /prod_almas
  # POST /prod_almas.json
  def create
    @prod_alma = ProdAlma.new(prod_alma_params)

    respond_to do |format|
      if @prod_alma.save
        format.html { redirect_to @prod_alma, notice: 'Prod alma was successfully created.' }
        format.json { render :show, status: :created, location: @prod_alma }
      else
        format.html { render :new }
        format.json { render json: @prod_alma.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prod_almas/1
  # PATCH/PUT /prod_almas/1.json
  def update
    respond_to do |format|
      if @prod_alma.update(prod_alma_params)
        format.html { redirect_to @prod_alma, notice: 'Prod alma was successfully updated.' }
        format.json { render :show, status: :ok, location: @prod_alma }
      else
        format.html { render :edit }
        format.json { render json: @prod_alma.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prod_almas/1
  # DELETE /prod_almas/1.json
  def destroy
    @prod_alma.destroy
    respond_to do |format|
      format.html { redirect_to prod_almas_url, notice: 'Prod alma was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prod_alma
      @prod_alma = ProdAlma.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prod_alma_params
      params.require(:prod_alma).permit(:cod_producto, :cod_almacen)
    end
end

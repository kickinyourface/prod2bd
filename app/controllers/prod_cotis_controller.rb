class ProdCotisController < ApplicationController
  before_action :set_prod_coti, only: [:show, :edit, :update, :destroy]

  # GET /prod_cotis
  # GET /prod_cotis.json
  def index
    @prod_cotis = ProdCoti.all
  end

  # GET /prod_cotis/1
  # GET /prod_cotis/1.json
  def show
  end

  # GET /prod_cotis/new
  def new
    @prod_coti = ProdCoti.new
  end

  # GET /prod_cotis/1/edit
  def edit
  end

  # POST /prod_cotis
  # POST /prod_cotis.json
  def create
    @prod_coti = ProdCoti.new(prod_coti_params)

    respond_to do |format|
      if @prod_coti.save
        format.html { redirect_to @prod_coti, notice: 'Prod coti was successfully created.' }
        format.json { render :show, status: :created, location: @prod_coti }
      else
        format.html { render :new }
        format.json { render json: @prod_coti.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prod_cotis/1
  # PATCH/PUT /prod_cotis/1.json
  def update
    respond_to do |format|
      if @prod_coti.update(prod_coti_params)
        format.html { redirect_to @prod_coti, notice: 'Prod coti was successfully updated.' }
        format.json { render :show, status: :ok, location: @prod_coti }
      else
        format.html { render :edit }
        format.json { render json: @prod_coti.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prod_cotis/1
  # DELETE /prod_cotis/1.json
  def destroy
    @prod_coti.destroy
    respond_to do |format|
      format.html { redirect_to prod_cotis_url, notice: 'Prod coti was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prod_coti
      @prod_coti = ProdCoti.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prod_coti_params
      params.require(:prod_coti).permit(:cod_cotiza, :cod_producto)
    end
end

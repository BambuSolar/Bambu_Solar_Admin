class ProductSubTypesController < SecurityController

  before_action :set_product_sub_type, only: [:show, :edit, :update, :destroy]

  before_action :set_product_type

  # GET /product_sub_types
  # GET /product_sub_types.json
  def index
    @product_sub_types = ProductSubType.where(product_type_id: @product_type.id).order(:name)
  end

  # GET /product_sub_types/1
  # GET /product_sub_types/1.json
  def show
  end

  # GET /product_sub_types/new
  def new
    @product_sub_type = ProductSubType.new
  end

  # GET /product_sub_types/1/edit
  def edit
  end

  # POST /product_sub_types
  # POST /product_sub_types.json
  def create
    @product_sub_type = ProductSubType.new(product_sub_type_params)
    @product_sub_type.product_type_id = @product_type.id
    respond_to do |format|
      if @product_sub_type.save
        format.html { redirect_to product_type_product_sub_types_path(@product_type), notice: 'Product sub type was successfully created.' }
        format.json { render :show, status: :created, location: @product_sub_type }
      else
        format.html { render :new }
        format.json { render json: @product_sub_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_sub_types/1
  # PATCH/PUT /product_sub_types/1.json
  def update
    @product_sub_type.product_type_id = @product_type.id
    respond_to do |format|
      if @product_sub_type.update(product_sub_type_params)
        format.html { redirect_to product_type_product_sub_types_path(@product_type), notice: 'Product sub type was successfully updated.' }
        format.json { render :show, status: :ok, location: @product_sub_type }
      else
        format.html { render :edit }
        format.json { render json: @product_sub_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_sub_types/1
  # DELETE /product_sub_types/1.json
  def destroy
    @product_sub_type.destroy
    respond_to do |format|
      format.html { redirect_to product_type_product_sub_types_path(@product_type), notice: 'Product sub type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_product_sub_type
    @product_sub_type = ProductSubType.find(params[:id])
  end

  def set_product_type
    @product_type = ProductType.find(params[:product_type_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_sub_type_params
    params.require(:product_sub_type).permit(:name, :type_product, :order, :denomination)
  end
end

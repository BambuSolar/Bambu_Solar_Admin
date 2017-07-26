class ProductCategoriesController < SecurityController
  before_action :set_product_category, only: [:show, :edit, :update, :destroy]

  before_action :set_product_type

  # GET /product_categories
  # GET /product_categories.json
  def index
    @product_categories = ProductCategory.where(:product_type_id => @product_type.id)
  end

  # GET /product_categories/1
  # GET /product_categories/1.json
  def show
  end

  # GET /product_categories/new
  def new
    @product_category = ProductCategory.new
  end

  # GET /product_categories/1/edit
  def edit
  end

  # POST /product_categories
  # POST /product_categories.json
  def create
    @product_category = ProductCategory.new(product_category_params)

    @product_category.product_type = @product_type

    respond_to do |format|
      if @product_category.save
        format.html { redirect_to product_type_product_categories_path(@product_type), notice: 'La categoría del producto fue creada correctamente.' }
        format.json { render :show, status: :created, location: @product_category }
      else
        format.html { render :new }
        format.json { render json: @product_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_categories/1
  # PATCH/PUT /product_categories/1.json
  def update
    respond_to do |format|
      if @product_category.update(product_category_params)
        format.html { redirect_to product_type_product_categories_path(@product_type), notice: 'La categoría del producto fue editada correctamente.' }
        format.json { render :show, status: :ok, location: @product_category }
      else
        format.html { render :edit }
        format.json { render json: @product_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_categories/1
  # DELETE /product_categories/1.json
  def destroy
    @product_category.destroy
    respond_to do |format|
      format.html { redirect_to product_type_product_categories_path(@product_type), notice: 'La categoría del producto fue eliminada correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_category
      @product_category = ProductCategory.find(params[:id])
    end

    def set_product_type
      @product_type = ProductType.find(params[:product_type_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_category_params
      params.require(:product_category).permit(:name, :product_type)
    end
end

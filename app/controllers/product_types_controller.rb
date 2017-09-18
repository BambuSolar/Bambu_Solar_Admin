class ProductTypesController < SecurityController
  before_action :set_product_type, only: [:show, :edit, :update, :destroy]

  # GET /product_types
  # GET /product_types.json
  def index
    @product_types = ProductType.all
  end

  # GET /product_types/1
  # GET /product_types/1.json
  def show

    query_by_name = params[:q].to_s

    @products =

    if query_by_name.size > 0

      @products = Product
                      .where(product_type_id: @product_type.id)
                      .where('lower(name) LIKE ?' , "%#{query_by_name.downcase}%")
                      .order(:name)
                      .paginate(:page => params[:page], :per_page => 10)

    else

      @products = Product
          .where(product_type_id: @product_type.id)
          .order(:name)
          .paginate(:page => params[:page], :per_page => 10)

    end

  end

  # GET /product_types/new
  def new
    @product_type = ProductType.new
  end

  # GET /product_types/1/edit
  def edit
  end

  # POST /product_types
  # POST /product_types.json
  def create
    @product_type = ProductType.new(product_type_params)

    p = Picture.new(photo: params[:product_type][:image])

    p.save!

    @product_type.picture = p

    respond_to do |format|
      if @product_type.save
        format.html { redirect_to @product_type, notice:'El tipo de producto ha sido creado correctamente.' }
        format.json { render :show, status: :created, location: @product_type }
      else
        format.html { render :new }
        format.json { render json: @product_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_types/1
  # PATCH/PUT /product_types/1.json
  def update

    unless params[:product_type][:image].nil?


      unless @product_type.picture.nil?

        @product_type.picture.remove_photo!

        @product_type.picture.save!

        @product_type.picture.update(photo: params[:product_type][:image])

        @product_type.picture.save!

      else

        p = Picture.new(photo: params[:product_type][:image])

        p.save!

        @product_type.picture = p

      end


    end

    respond_to do |format|
      if @product_type.update(product_type_params)
        format.html { redirect_to product_types_path, notice: 'El tipo de producto ha sido editado correctamente.' }
        format.json { render :show, status: :ok, location: @product_type }
      else
        format.html { render :edit }
        format.json { render json: @product_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_types/1
  # DELETE /product_types/1.json
  def destroy

    products = Product.where(product_type_id: @product_type.id)

    products.each do |product|

      p = @product.picture

      p.remove_photo!

      product.destroy

      p.destroy!

    end

    p = @product_type.picture

    p.remove_photo!

    p.destroy!

    @product_type.destroy

    respond_to do |format|
      format.html { redirect_to product_types_url, notice: 'El tipo de producto ha sido eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_type
      @product_type = ProductType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_type_params
      params.require(:product_type).permit(:name, :have_classification, :have_sub_type, :order, :allow_category)
    end
end

class ProductsController < SecurityController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  before_action :set_product_type

  # GET /products
  # GET /products.json
  def index

      query_by_name = params[:q].to_s

      @products = Product.all.paginate(:page => params[:page], :per_page => 10)

      if query_by_name.size > 0

        @products.where('name LIKE ?' , "%#{query_by_name}%")

      end

  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
    @product_sub_types = ProductSubType.where(product_type_id: @product_type.id).order(:name)
  end

  # GET /products/1/edit
  def edit
    @product_sub_types = ProductSubType.where(product_type_id: @product_type.id).order(:name)
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    @product.product_type_id = @product_type.id
    respond_to do |format|
      if @product.save

        unless params[:product][:image].nil?

          p = Picture.new(photo: params[:product][:image])

          p.save!

          @product.picture = p

          @product.save

        end

        if @product.to_quote

          @product.price = 0

          @product.save!

        end

        format.html { redirect_to @product_type, notice: 'El producto ha sido creado correctamente' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @product.product_type_id = @product_type.id

    respond_to do |format|

      if @product.update(product_params)

        unless params[:product][:image].nil?

          unless @product.picture.nil?

            @product.picture.remove_photo!

            @product.picture.save!

            @product.picture.update(photo: params[:product][:image])

            @product.picture.save!

          else

            p = Picture.new(photo: params[:product][:image])

            p.save!

            @product.picture = p

            @product.save!

          end

        end

        if @product.to_quote

          @product.price = 0

          @product.save!

        end

        format.html { redirect_to @product_type, notice: 'El producto ha sido actualizado correctamente' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy

    p = @product.picture

    p.remove_photo!

    @product.destroy

    p.destroy!

    respond_to do |format|
      format.html { redirect_to @product_type, notice: 'El producto ha sido eliminado correctamente' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    def set_product_type
      @product_type = ProductType.find(params[:product_type_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :description_detail, :price, :enabled, :product_type_id,
                                      :url_video_youtube, :classification, :sub_type_id, :to_quote)
    end
end

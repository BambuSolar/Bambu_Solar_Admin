class ProductPicturesController < SecurityController
  before_action :set_product_picture, only: [:show, :edit, :update, :destroy]

  before_action :set_product

  # GET /product_pictures
  # GET /product_pictures.json
  def index
    @product_pictures = ProductPicture.all
    @product_picture = ProductPicture.new
  end

  # GET /product_pictures/1
  # GET /product_pictures/1.json
  def show
  end

  # GET /product_pictures/new
  def new
    @product_picture = ProductPicture.new
  end

  # GET /product_pictures/1/edit
  def edit
  end

  # POST /product_pictures
  # POST /product_pictures.json
  def create

    if params[:image]

      @product_picture = ProductPicture.new

      p = Picture.new(photo: params[:image])

      p.save!

      @product_picture.picture = p

      @product_picture.product = @product

      respond_to do |format|
        if @product_picture.save
         # format.html { redirect_to product_type_product_product_pictures_path(@product.product_type, @product), notice: 'Product picture was successfully created.' }
         # format.json { render :show, status: :created, location: [@product.product_type, @product] }
          format.js
        else
          format.html { render :new }
          format.json { render json: @product_picture.errors, status: :unprocessable_entity }
          format.js
        end
      end

    else

      respond_to do |format|
          format.html { redirect_to product_type_product_product_pictures_path(@product.product_type, @product), notice: '' }
          format.json { render :index, status: :created, location: [@product.product_type, @product] }
          format.js
      end

    end

  end

  # PATCH/PUT /product_pictures/1
  # PATCH/PUT /product_pictures/1.json
  def update
    respond_to do |format|
      if @product_picture.update(product_picture_params)
        format.html { redirect_to @product_picture, notice: 'Product picture was successfully updated.' }
        format.json { render :show, status: :ok, location: @product_picture }
      else
        format.html { render :edit }
        format.json { render json: @product_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_pictures/1
  # DELETE /product_pictures/1.json
  def destroy

    p = @product_picture.picture

    p.remove_photo!

    @product_picture.destroy

    p.destroy!

    respond_to do |format|
      format.html { redirect_to product_type_product_product_pictures_path(@product.product_type, @product), notice: 'El la imágen ha sido eliminada correctamente.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_product_picture
    @product_picture = ProductPicture.find(params[:id])
  end

  def set_product_type
    @product_type = ProductType.find(params[:product_type_id])
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_picture_params
    #params.require(:product_picture).permit(:product_id)
  end
end

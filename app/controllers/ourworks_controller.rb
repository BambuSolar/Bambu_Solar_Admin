class OurworksController < SecurityController
  before_action :set_ourwork, only: [:show, :edit, :update, :destroy]

  # GET /ourworks
  # GET /ourworks.json
  def index
    @ourworks = Ourwork.all
  end

  # GET /ourworks/new
  def new
    @ourwork = Ourwork.new
  end

  # GET /ourworks/1/edit
  def edit
  end

  # POST /ourworks
  # POST /ourworks.json
  def create

    @ourwork = Ourwork.new(ourwork_params)

    p = Picture.new(photo: params[:ourwork][:image])

    p.save!

    @ourwork.picture = p

    respond_to do |format|
      if @ourwork.save
        format.html { redirect_to ourworks_url, notice: 'La imágen ha sido cargada correctamente' }
        format.json { render :show, status: :created, location: @ourwork }
      else
        format.html { render :new }
        format.json { render json: @ourwork.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ourworks/1
  # PATCH/PUT /ourworks/1.json
  def update

    unless params[:ourwork][:image].nil?

      @ourwork.picture.remove_photo!

      @ourwork.picture.save!

      @ourwork.picture.update(photo: params[:ourwork][:image])

      @ourwork.picture.save!

    end

    respond_to do |format|
      if @ourwork.update(ourwork_params)
        format.html { redirect_to ourworks_url, notice: 'La imágen ha sido modificada correctamente.' }
        format.json { render :show, status: :ok, location: @ourwork }
      else
        format.html { render :edit }
        format.json { render json: @ourwork.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /ourworks/1
  # DELETE /ourworks/1.json
  def destroy

    p = @ourwork.picture

    p.remove_photo!

    @ourwork.destroy

    p.destroy!

    @ourwork.destroy

    respond_to do |format|
      format.html { redirect_to ourworks_url, notice: 'Ourwork was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ourwork
      @ourwork = Ourwork.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ourwork_params
      params.require(:ourwork).permit(:title)
    end
end

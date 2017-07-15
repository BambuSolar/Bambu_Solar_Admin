class RibbonsController < SecurityController
  before_action :set_ribbon, only: [:show, :edit, :update, :destroy]

  # GET /ribbons
  # GET /ribbons.json
  def index
    @ribbons = Ribbon.all.order(:order)
  end

  # GET /ribbons/1
  # GET /ribbons/1.json
  def show
  end

  # GET /ribbons/new
  def new
    @ribbon = Ribbon.new
  end

  # GET /ribbons/1/edit
  def edit
  end

  # POST /ribbons
  # POST /ribbons.json
  def create
    @ribbon = Ribbon.new(ribbon_params)

    p = Picture.new(photo: params[:ribbon][:image])

    p.save!

    @ribbon.picture = p

    respond_to do |format|
      if @ribbon.save
        format.html { redirect_to ribbons_path, notice: 'El ribbon ha sido creado correctamente.' }
        format.json { render :show, status: :created, location: @ribbon }
      else
        format.html { render :new }
        format.json { render json: @ribbon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ribbons/1
  # PATCH/PUT /ribbons/1.json
  def update

    unless params[:ribbon][:image].nil?

      unless @ribbon.picture.nil?

        @ribbon.picture.remove_photo!

        @ribbon.picture.save!

        @ribbon.picture.update(photo: params[:ribbon][:image])

        @ribbon.picture.save!

      else

        p = Picture.new(photo: params[:ribbon][:image])

        p.save!

        @ribbon.picture = p

      end


    end
    respond_to do |format|
      if @ribbon.update(ribbon_params)
        format.html { redirect_to ribbons_path, notice: 'El ribbon ha sido editado correctamente.' }
        format.json { render :show, status: :ok, location: @ribbon }
      else
        format.html { render :edit }
        format.json { render json: @ribbon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ribbons/1
  # DELETE /ribbons/1.json
  def destroy

    p = @ribbon.picture

    p.remove_photo!

    p.destroy!

    @ribbon.destroy

    respond_to do |format|
      format.html { redirect_to ribbons_url, notice: 'El ribbon ha sido eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_ribbon
    @ribbon = Ribbon.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def ribbon_params
    params.require(:ribbon).permit(:text, :link, :order)
  end
end

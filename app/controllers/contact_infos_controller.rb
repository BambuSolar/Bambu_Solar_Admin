class ContactInfosController < SecurityController

  # GET /contact_infos
  # GET /contact_infos.json
  def index
    @contact_info = ContactInfo.first
  end
  # GET /contact_infos/1/edit
  def edit
    @contact_info = ContactInfo.first
  end

  # PATCH/PUT /contact_infos/1
  # PATCH/PUT /contact_infos/1.json
  def update

    @contact_info = HomeWebsiteConfig.first

    respond_to do |format|
      if @contact_info.update(contact_info_params)
        format.html { redirect_to contact_info_path, notice: 'Contact info was successfully updated.' }
        format.json { render :index, status: :ok, location: @contact_info }
      else
        format.html { render :edit }
        format.json { render json: @contact_info.errors, status: :unprocessable_entity }
      end
    end
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_info_params
      params.require('/contact_info/edit').permit(:iframe_map, :telephones, :emails, :facebook_link, :mercadolibre_link, :address_text)
    end
end

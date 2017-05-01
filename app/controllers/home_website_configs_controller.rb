class HomeWebsiteConfigsController < SecurityController

  # GET /home_website_configs
  # GET /home_website_configs.json
  def index
    @home_website_config = HomeWebsiteConfig.first
  end

  # GET /home_website_configs/1/edit
  def edit
    @home_website_config = HomeWebsiteConfig.first
  end

  # PATCH/PUT /home_website_configs/1
  # PATCH/PUT /home_website_configs/1.json
  def update

    @home_website_config = HomeWebsiteConfig.first

    unless params['home_website_config/edit'][:horizontal_picture].nil?


      unless @home_website_config.horizontal_picture.nil?

        @home_website_config.horizontal_picture.remove_photo!

        @home_website_config.horizontal_picture.save!

        @home_website_config.horizontal_picture.update(photo: params['home_website_config/edit'][:horizontal_picture])

        @home_website_config.horizontal_picture.save!

      else

        p = Picture.new(photo: params['home_website_config/edit'][:horizontal_picture])

        p.save!

        @home_website_config.horizontal_picture = p

      end

    end

    unless params['home_website_config/edit'][:vertical_picture].nil?


      unless @home_website_config.vertical_picture.nil?

        @home_website_config.vertical_picture.remove_photo!

        @home_website_config.vertical_picture.save!

        @home_website_config.vertical_picture.update(photo: params['home_website_config/edit'][:vertical_picture])

        @home_website_config.vertical_picture.save!

      else

        p = Picture.new(photo: params['home_website_config/edit'][:vertical_picture])

        p.save!

        @home_website_config.vertical_picture = p

      end

    end

    respond_to do |format|
      if @home_website_config.update(home_website_config_params)
        format.html { redirect_to home_website_config_url, notice: 'Home website config was successfully updated.' }
        format.json { render :show, status: :ok, location: @home_website_config }
      else
        format.html { render :edit }
        format.json { render json: @home_website_config.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def home_website_config_params
    params.require('home_website_config/edit').permit(:welcome_message)
  end
end

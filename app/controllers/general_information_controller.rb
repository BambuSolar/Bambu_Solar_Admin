class GeneralInformationController < SecurityController
  before_action :set_general_information, only: [:index, :edit, :update]

  # GET /general_information
  # GET /general_information.json
  def index

  end

  # GET /general_information/1/edit
  def edit
  end

  # PATCH/PUT /general_information/1
  # PATCH/PUT /general_information/1.json
  def update
    respond_to do |format|
      if @general_information.update(general_information_params)
        format.html { redirect_to @general_information, notice: 'General information was successfully updated.' }
        format.json { render :show, status: :ok, location: @general_information }
      else
        format.html { render :edit }
        format.json { render json: @general_information.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_general_information
      @general_information = GeneralInformation.first!
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def general_information_params
      params.require('general_information/edit').permit(:demonstrative_video, :catalog)
    end
end

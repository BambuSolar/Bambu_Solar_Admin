class UsersController < SecurityController

  before_action :set_user, only: [:edit, :update, :destroy]

  def index

    @users = User.all

  end

  def new
    @user = User.new
  end

  def create

    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: 'El usuario ha sido creado correctamente' }
        format.json { render :index, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

  end

  def edit

  end

  def update

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: 'El usuario ha sido actualizado correctamente' }
        format.json { render :index, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

  end

  def destroy

    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path, notice: 'El usuario ha sido eliminado correctamente' }
      format.json { head :no_content }
    end

  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :user_name, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

end

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  ##SORRY POR REPEAT
  autocomplete :user, :rut, :extra_data => [:rut,:first_name, :last_name, :mail], :display_value => :funky_method
  autocomplete :user, :last_name, :extra_data=> [:rut,:first_name, :last_name, :mail],:display_value =>:funky_method, :full=>true

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1q
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: 'Usuario creado correctamente.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: 'Usuario actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Usuario eliminado.' }
      format.json { head :no_content }
    end
  end

  def search
    @user=User.new
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:rut, :first_name, :last_name, :mail, :birthday, :password, :password_confirmation, :image,
                                 profiles_attributes:[:id, :name, :url, :_destroy])
  end
end

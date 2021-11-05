class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy, :edit]
  # before_action :authenticate_request #TODO only for certain actions

  # GET /users
  def index
    # binding.pry
    @users = User.all
  end

  # GET /users/1
  def new
    @user = User.new
  end

  def show
  end

  # POST /users
  def create
    @user = User.new(user_params)
    @user.password = 'password'
    if @user.save
      redirect_to users_path, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :role, :description)
    end
end

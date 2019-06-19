class UsersController < ApplicationController

  skip_before_action :authorized?, only: [:new, :create]

  def index
    if params[:search]
      @users = User.where("username like ?", "%#{params[:search]}%")
      # @users = User.where(name: params[:search])
    else
      @users = User.all
    end

  end

  def show
    @gift = Gift.new
    @deeds = Deed.all
    find_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.valid?
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end

  end

  def follow
    find_user
    @current_user.followees << @user
    redirect_to user_path(@user)
  end

  # def new_gift
  #   @gift = Gift.new
  #   @deeds = Deed.all
  #   find_user
  # end

  def create_gift
    find_user
    # byebug
    Gift.create(gift_params)
    redirect_to user_path(@user)
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :location, :bio)
  end

  def gift_params
    params.require(:gift).permit(:deed_id, :receiver_id, :giver_id)
  end

end

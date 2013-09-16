class UsersController < ApplicationController

  # 訪問「edit」之前，先檢查有無登入
  before_action :check_signed_in, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :check_admin, only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params);
    if @user.save
      flash[:success] = "建立成功！"
      sign_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:success] = "儲存成功！"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "刪除成功"
    redirect_to :back
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def check_signed_in
      unless signed_in?
        store_url
        redirect_to sign_in_path, notice: "請先登入"
      end
    end

    def correct_user
      @user = User.find(params[:id])
      unless current_user.admin? || current_user?(@user)
        redirect_to users_path, notice: "非該用戶，沒有權限編輯"
      end
    end

    def check_admin
      redirect_to root_path unless current_user.admin?
    end
end

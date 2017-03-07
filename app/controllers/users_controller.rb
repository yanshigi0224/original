class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def show
   @user = User.find(params[:id])
   @diaries = @user.diaries.order(created_at: :desc)
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
    if (current_user != @user)
      redirect_to root_path
    end
  end
  
  def update
    @user = User.find(params[:id])
     # @userは編集対象ユーザー
    if (current_user != @user)
      redirect_to root_path
      return
    end   
    
    if (@user.update(user_profile))
      redirect_to @user
    else
      flash.now[:danger] = "更新できませんでした"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
  
  def user_profile
    params.require(:user).permit(:name,:email,:password,:password_confirmation,:location,:hobby,:thema)
  end  
end

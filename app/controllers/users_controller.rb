class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.params(params_user)
    if @user.save
      redirect_to user_path, notice: "登録に成功しました"
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end

  def edit
    set_user
  end

  def update
    set_user
    if @user.update(params_user)
      flash[:success] = "ユーザー情報を更新しました"
    else
      flash[:danger] = "ユーザー情報の更新に失敗しました"
    end
    redirect_to user_path
  end

  def destroy
    set_user
    if @user.destroy
      flash[:success] = "削除しました"
    else
      flash[:danger] = "削除に失敗しました"
    end
    redirect_to user_path
  end

  def show
    set_user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def params_user
    params.require(:user).permit%i[email password password_confirmation]
  end
end

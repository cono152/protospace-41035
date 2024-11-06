class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :validate_user_id, only: [:show]

  def show
    @user = User.find(params[:id])
    @user_prototypes = @user.prototypes

    if @user != current_user
      flash[:alert] = "アクセス権限がありません。"
      redirect_to root_path and return
    end

    @comments = @user.comments
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def edit
  end

  private

  def validate_user_id
    unless params[:id].to_i.to_s == params[:id]
      flash[:alert] = "無効なユーザーIDです。"
      redirect_to root_path and return
    end
  end
end
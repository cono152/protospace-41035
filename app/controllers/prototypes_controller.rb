class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :set_prototype, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, except: [:index, :show, :search]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      flash[:success] = "Prototype created successfully!"
      redirect_to root_path
    else
      Rails.logger.debug @prototype.errors.full_messages
      render 'new'
    end
  end

  def show
    @comments = @prototype.comments.includes(:user)
    @comment = Comment.new
    @user = @prototype.user
    @user_prototypes = @user.prototypes
  end

  def edit
  end

  def update
    if @prototype.update(prototype_params)
      flash[:success] = "Prototype has been updated successfully!"
      redirect_to @prototype
    else
      render 'edit'
    end
  end

  def destroy
    @prototype.destroy
    redirect_to prototypes_path, notice: '削除が完了しました。'
    #log_out
  end

  private

  def set_prototype
    @prototype = Prototype.find_by(id: params[:id])
    unless @prototype
      redirect_to prototypes_path, alert: "Prototype not found."
    end
  end

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image, room_ids: []).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def correct_user
    set_prototype
    unless current_user == @prototype.user
      redirect_to root_path, alert: "You are not authorized to perform this action."
    end
  end

  def search
    @prototypes = prototype.search(params[:keyword])
  end
end
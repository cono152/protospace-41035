class CommentsController < ApplicationController
  def create
    Rails.logger.debug params.inspect  # パラメーターの内容を出力

    @comment = Comment.new(comment_params)
    @prototype = @comment.prototype

    if @comment.save
      redirect_to prototype_path(@comment.prototype.id)
    else
      flash[:alert] = "コメントの投稿に失敗しました。"
      @comments = @prototype.comments.includes(:user)
      render 'prototypes/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
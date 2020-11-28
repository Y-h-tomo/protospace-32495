class CommentsController < ApplicationController

  #コメント保存できた場合は詳細ページに,できなかった場合はユーザー情報を紐づけた上で詳細ページに遷移
  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to prototype_path(@comment.prototype_id)
    else
      @comment = @prototype.comment.includes(:user)
      render "prototypes/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
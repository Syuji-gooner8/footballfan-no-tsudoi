class Public::CommentsController < ApplicationController
  before_action :authenticate_customer!, except: [:destroy]
  def create
    post = Post.find(params[:post_id])
    @comment = Comment.new
    comment = current_customer.comments.new(comment_params)
    comment.post_id = post.id
    comment.save
    redirect_to post_path(post)
  end

  def destroy
    Comment.find(params[:id]).destroy
    if @comment.customer_id == current_customer.id
      @comment.destroy
      redirect_to post_path(params[:post_id])
      flash[:notice] = "コメントを削除しました"
    else
      redirect_to post_path(params[:post_id])
      flash[:alert] = "他人のコメントは削除できません"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end

class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @posts = Post.all.page(params[:page]).per(10)
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
    redirect_to admin_posts_path, notice: "投稿を削除しました"
    else
    flash.now[:danger] = "削除に失敗しました"
    render 'show'
    end
  end

  private

  def post_params
    params.require(:post).permit(:post_title, :body, :image, :soccer_group_id)
  end
end

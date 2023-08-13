class Public::PostsController < ApplicationController
  def index
    @posts = Post.all.page(params[:page]).per(10)
    #投稿順に表示させるように
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path, notice: "投稿を編集しました"
    else
      flash.now[:danger] = "編集に失敗しました"
      render 'edit'
    end
  end

  private

  def post_params
    params.require(:post).permit(:post_title, :body, :image)
  end
end

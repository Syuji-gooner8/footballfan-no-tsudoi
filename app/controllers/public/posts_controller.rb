class Public::PostsController < ApplicationController
  before_action :ensure_guest_customer, only: [:edit, :new]
  def index
    @posts = Post.all.page(params[:page]).per(10).order(created_at: :desc)
  end

  def search
    @posts = Post.search(params[:keyword]).order(created_at: :desc)
  end

  def new
    @post = Post.new
    soccergroups = []
    SoccerGroup.all.each do |s|
      soccergroup = []
      soccergroup.push(s.name)
      soccergroup.push(s.id)
      soccergroups.push(soccergroup)
    end
    @soccergroups = soccergroups
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
    #@post = Post.new
    @comment = Comment.new
    @comments = @post.comments.page(params[:page]).per(7).reverse_order
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

  def ensure_guest_customer

    if current_customer.email == "guest@example.com"
      redirect_to posts_path(current_customer) , notice: "ゲスト会員は投稿ページと編集ページへ遷移できません"
    end
  end

  def post_params
    params.require(:post).permit(:post_title, :body, :image, :soccer_group_id)
  end
end

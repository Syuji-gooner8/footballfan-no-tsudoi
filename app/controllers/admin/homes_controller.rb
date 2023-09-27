class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
     @posts = Post.all.order("created_at DESC").page(params[:post]).per(10)
  end
  
  def post_params
    params.require(:post).permit(:post_title, :body, :image, :soccergroup_id)
  end
end

class Public::LikesController < ApplicationController
  
   def create
    @post = Post.find(params[:post_id])
    post = Post.find(params[:post_id])
    like = Like.new(post_id: post.id)
    like.customer_id = current_customer.id
    like.save
  end

  def destroy
    @post = Post.find(params[:post_id])
    post = Post.find(params[:post_id])
    like = current_customer.likes.find_by(post_id: post.id)
    like.destroy
  end

end

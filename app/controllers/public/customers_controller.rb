class Public::CustomersController < ApplicationController
  before_action :ensure_guest_customer, only: [:edit]
  before_action :set_customer, only: [:likes]

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    customer = current_customer
    customer.update(customer_params)
    redirect_to customer_path(current_customer)
  end

  def check
    @customer = current_customer
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_withdrawal: true)
    reset_session
    redirect_to root_path
  end

  def likes
    likes = Like.where(customer_id: @customer.id).pluck(:post_id)
    @like_posts = Post.find(likes)
  end

  private

  def ensure_guest_customer
    @customer = Customer.find(params[:id])
    if @customer.email == "guest@example.com"
      redirect_to customers_path(current_customer) , notice: "ゲスト会員はプロフィール編集画面へ遷移できません"
    end
  end

  def customer_params
    params.require(:customer).permit(:name, :phone_number, :post_code, :address, :email, :image, :encrypted_password, :is_withdrawal)
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end
end

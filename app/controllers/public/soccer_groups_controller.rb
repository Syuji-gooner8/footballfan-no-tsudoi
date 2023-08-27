class Public::SoccerGroupsController < ApplicationController
  before_action :ensure_guest_customer, only: [:new]
  def index
    @soccergroups = SoccerGroup.all
  end

  def new
    @soccergroup = SoccerGroup.new
  end

  def search
    @soccergroups = SoccerGroup.search(params[:keyword]).order(created_at: :desc)
  end

  def create
    soccergroup = SoccerGroup.new(soccergroup_params)
    if soccergroup.save
      redirect_to soccer_groups_path
    else
      render 'new'
    end
  end

  private

  def ensure_guest_customer
    @customer = Customer.find(params[:id])
    if @customer.email == "guest@example.com"
      redirect_to new_soccer_group_path(current_customer) , notice: "ゲスト会員はサッカーグループ登録画面へ遷移できません"
    end
  end

  def soccergroup_params
    params.require(:soccer_group).permit(:teamname, :leaguename, :name)
  end
end

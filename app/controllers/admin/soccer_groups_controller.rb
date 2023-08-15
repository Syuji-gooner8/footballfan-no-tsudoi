class Admin::SoccerGroupsController < ApplicationController
  def index
    @soccergroups = SoccerGroup.all
  end
  
  def new
    @soccergroup = SoccerGroup.new
  end
  
  
  def create
    soccergroup = SoccerGroup.new(@soccergroup_params)
    if soccergroup.save
      redirect_to admin_soccer_groups_path
    else
      render 'new'
    end
  end
  
  def edit
    @soccergroup = SoccerGroup.find(params[:id])
  end

  def update
    @soccergroup = SoccerGroup.find(params[:id])
    if @soccergroup.update(soccergroup_params)
      redirect_to admin_soccer_groups_path, notice: "編集に成功しました"
    end
      render 'edit'
  end
  
  def destroy
    @soccergroup = SoccerGroup.find(params[:id])
    if @soccergroup.destroy
    redirect_to admin_soccer_groups_path, notice: "投稿を削除しました"
    else
    flash.now[:danger] = "削除に失敗しました"
    render 'index'
    end
  end
  
  private
  
  def soccergroup_params
    params.require(:soccer_group).permit(:teamname, :leaguename, :name)
  end
end

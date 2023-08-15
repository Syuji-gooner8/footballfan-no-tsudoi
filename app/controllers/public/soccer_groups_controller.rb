class Public::SoccerGroupsController < ApplicationController
  def index
    @soccergroups = SoccerGroup.all
  end

  def new
    @soccergroup = SoccerGroup.new
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

  def soccergroup_params
    params.require(:soccer_group).permit(:teamname, :leaguename, :name)
  end
end

class LinksController < ApplicationController

  def index
    @crumbs << Crumb.new("Links", "")
  end

  def show
    if !@selectedGroup || @selectedGroup <= 0
      @groups = LinkGroup.all
    end
  end

  def get_links
    @selectedGroup = params[:group]
    @groups = LinkGroup.all
    #_grp = LinkGroup.find(@selectedGroup)
    @group_links = (@selectedGroup != '1') ? Link.find(:all, :include => :link_groups, :conditions => {"grouped_links.link_group_id" => @selectedGroup}) : Link.all
    render :action => 'show'
  end

  def new
  end

  def edit
  end

  def update
  end

  def create
  end

  def destroy
  end

end

class HomeController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]

  def index
    @crumbs ||= []
    @crumbs << Crumb.new("Home", "")
  end


end

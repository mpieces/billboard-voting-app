class BillboardsController < ApplicationController
  before_action :authenticate_user!

  def index
    # @billboards = Billboard.all
    @billboards = Billboard.order(score: :desc)
  end

  def import 
    Billboard.import(params[:file])
    redirect_to root_url, notice: "Billboards imported!"
  end

  def upvote
    @billboard = Billboard.find(params[:id])
    @billboard.votes.create 
    redirect_to root_url 
  end


end

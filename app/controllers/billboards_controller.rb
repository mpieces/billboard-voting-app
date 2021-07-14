class BillboardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @billboards = Billboard.order('votes_count DESC') 
    
  end

  def import 
    Billboard.import(params[:file])
    redirect_to root_url, notice: "Billboards imported!"
  end

  # def upvote
  #   @billboard = Billboard.find(params[:id])
  #   @billboard.votes.create 
  #   redirect_to root_url 
  # end

  def show
    @billboard = Billboard.find(params[:id])
    respond_to do |format| 
      format.js { render partial: 'billboards/show' }
    end 
  end

end

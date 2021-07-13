class BillboardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @billboards = Billboard.all
  end

  def import 
    Billboard.import(params[:file])
    redirect_to root_url, notice: "Billboards imported!"
  end

end

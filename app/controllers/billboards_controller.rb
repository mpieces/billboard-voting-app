class BillboardsController < ApplicationController
  before_action :authenticate_user!

  def index
    # @billboards = Billboard.all.sort_by{|billboard| billboard.calculate_rank(2,2,1.8)}
    # @billboards = Billboard.all.sort_by(&:calculate_rank)
    @billboards = Billboard.order('votes_count DESC') 
  end

  def import 
    Billboard.import(params[:file])
    redirect_to root_url, notice: "Billboards imported!"
  end

  def vote
    @billboard = Billboard.find(params[:id])
    direction = params[:vote_direction]
    vote = Vote.find_or_initialize_by(billboard: @billboard, user: current_user)
    if direction == "up"
      vote.upvote = true
    else
      vote.upvote = false
    end
    vote.save!
    # redirect_to root_url 
  end

  def show
    @billboard = Billboard.find(params[:id])
    respond_to do |format| 
      format.js { render partial: 'billboards/show' }
    end 
  end

end

# request:
#   billboard_id: 
#   vote_direction: (upvote true or false)

  # find a vote if it exists and update it
  # create a new vote with this data

  # you want it to be a post request

  # BillbaordsController#vote
  # VotingController#create
  # VotingController#update
  # VotingController#vote
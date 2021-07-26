class BillboardsController < ApplicationController
  before_action :authenticate_user!

  def index
    # @billboards = Billboard.all.sort_by{ |billboard| -1 * billboard.calculate_rank(2,2,1.8) }
    @billboards = Billboard.all.sort_by(&:calculate_rank).reverse
  end

  def import 
    Billboard.import(params[:file])
    redirect_to root_url, notice: "Billboards imported!"
  end

  def vote
    @billboard = Billboard.find(params[:id])
    direction = params[:direction]
    # binding.pry
    vote = Vote.find_or_initialize_by(billboard: @billboard, user: current_user)
    if direction == "up"
      vote.upvote = true
    elsif direction == "down"
      vote.upvote = false
    else
      raise "Invalid vote direction"
    end
    if vote.save
      render json: { status: 200, vote_score: @billboard.vote_score, direction: direction }  
      # @billboard.votes_score value is showing up correctly in console under Network --> Response
      else 
        render json: { status: 400, error: vote.errors.full_messages.join(", ") }
      end
  end

  def show
    @billboard = Billboard.find(params[:id])
    respond_to do |format| 
      format.js { render partial: 'billboards/show' }
    end 
  end

end

# requesting:
#   billboard_id: 
#   vote_direction: (upvote true or false)

  # find a vote if it exists and update it
  # create a new vote with this data

  # you want it to be a post request

  # BillbaordsController#vote
  # VotingController#create
  # VotingController#update
  # VotingController#vote
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
    # respond_to do |format| 
    #   format.js { render partial: 'billboards/show' }
    # end 
  end

  def new
    @billboard = Billboard.new
  end

  def create
    @billboard = Billboard.new(billboard_params)

    if @billboard.save
      redirect_to root_path, notice: "Billboard was successfully created."
    else
      render :new
    end
  end
  
  def edit
    @billboard = Billboard.find(params[:id])
  end

  def update
    @billboard = Billboard.find(params[:id])
    if @billboard.update(billboard_params)
      redirect_to @billboard
    else
      render :edit
    end
  end

  def destroy
    @billboard = Billboard.find(params[:id])
    @billboard.destroy
    redirect_to root_path
  end

  private

  def billboard_params
    params.require(:billboard).permit(:name, :image, :lat, :lon, :size, :screen_type, :direction, :orientation, :unit_type)
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